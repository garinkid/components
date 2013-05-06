#!/usr/bin/env python

import roslib; roslib.load_manifest('edufill_object_detection')
import rospy
from std_msgs.msg import Int64
from std_msgs.msg import String
from sensor_msgs.msg import Image
from sensor_msgs.msg import PointCloud2
from geometry_msgs.msg import PoseStamped
from cv_bridge import CvBridge, CvBridgeError
import cv2
from cv2.cv import CV_FOURCC, RGB
import numpy as np
import os
from os import errno
from os.path import dirname, basename, realpath
from sys import exit, argv, stderr
from histogram import Histogram
from myutils import calc_back_proj, draw_cross, hsv_filter_mask, draw_debug_messages
import numpy as np
from numpy.random import randint
from edufill_object_detection.srv import *
from point_cloud2 import read_points
from errno import EEXIST

DETECT_METHOD_CONTOUR = 'contour'
DETECT_METHOD_TEMPLATE = 'template'
DETECT_METHOD = DETECT_METHOD_CONTOUR
DEBUG = True
DETECT_PERF = False
DETECT_PERF_FILE = 'detect_perf.txt'
OUT_DIR = 'edufill_object_detection_out'

DEF_RGB_TOPIC    = '/camera/rgb/image_rect_color'
DEF_CLOUD_TOPIC    = '/camera/depth_registered/points'
DEF_RES_SERVICE  = '/edufill_objdetector/detect_cubes'

YELLOW_HSV_LOW = np.array([0, 50, 65], dtype=np.uint8)

bridge = CvBridge()

def cv_image_from_ros_msg(msg, dtype = 'bgr8'):
    try:
        img = bridge.imgmsg_to_cv(msg, dtype)
        if dtype == 'bgr8':
            img = np.asarray(img)
        else:
            img = np.asarray(img)
    except CvBridgeError, e:
        print e
    return img

class CubeColorDetector:
    def __init__(self, rgb_only_camera):
        self.rgb_only_camera = rgb_only_camera
        H = os.getenv('ROS_HOME')
        assert H != None
        #histogram file, Histogram object, Hue center, Saturation low margin
        self.known_histograms = { 'red':     [H + '/histograms/red_cube.hst', None, 0, 0], \
                                  'green':   [H + '/histograms/green_cube.hst', None, 10, 0], \
                                  'blue':    [H + '/histograms/blue_cube.hst', None, 107, 120], \
                                  'yellow':  [H + '/histograms/yellow_cube.hst', None, 10, 0], \
                                  'cyan':    [H + '/histograms/cyan_cube.hst', None, 10, 0], \
                                  'magenta': [H + '/histograms/magenta_cube.hst', None, 10, 0] }
        rospy.init_node('cube_color_detector', anonymous=True)
        self.hists = []
        self.img = None
        self.rgb_subscriber = None
        self.rgb_frame_cnt = 0
        self.res_service = rospy.Service(DEF_RES_SERVICE, DetectCube, self.detect_cubes_cb)
        self.rgb = None
        if DETECT_PERF:
            self.dperf_file = file(DETECT_PERF_FILE, 'w')
        print 'Waiting for service calls...'

    def set_rgb_topic(self, topic_name):
        if not self.rgb_only_camera:
            self.rgb_subscriber = rospy.Subscriber(topic_name, Image, self.rgb_cb)

    def set_cloud_topic(self, topic_name):
        if not self.rgb_only_camera:
            self.cloud_subscriber = rospy.Subscriber(topic_name, PointCloud2, self.cloud_cb)

    def err_resp(self):
        resp = DetectCubeResponse()
        resp.sizes.append(-1)
        pose = PoseStamped()
        pose.pose.position.x = -1
        pose.pose.position.y = -1
        resp.poses.append(pose)
        return resp
    
    def detect_cubes_template(self, hsv_planes, req):
        candidates = []
        size = (req.min_size + req.max_size) / 2
        templ = np.zeros([size, size], dtype='uint8') + self.known_histograms[req.color][2]
        match_unext = cv2.matchTemplate(hsv_planes[0], templ, cv2.TM_SQDIFF)
        match = np.ones(hsv_planes[0].shape, dtype='float32') * np.finfo(np.float32).max
        match[0:match_unext.shape[0], 0:match_unext.shape[1]] = match_unext
        _max = np.max(match)
        match_img = _max - match
        _max =  np.max(match_img)
        match_img = (match_img / _max * 255).astype('uint8')
        cv2.imwrite('match_hue.png', match_img)
        sat = cv2.threshold(hsv_planes[1], self.known_histograms[req.color][3], 1, cv2.THRESH_BINARY_INV)[1] + 1
        match *= sat
        (min_x, max_y, minloc, maxloc) = cv2.minMaxLoc(match)
        (x, y) = minloc
        result = np.reshape(match, match.shape[0] * match.shape[1])
        sort = np.argsort(result)[::-1]
        (y1, x1) = np.unravel_index(sort[0], match.shape) #best match
        #(y2, x2) = np.unravel_index(sort[1], match.shape) #second best match
        candidates.append([x1 - size / 2, y1 - size / 2, x1 + size / 2, y1 + size / 2])
        #candidates.append([x2 - size / 2, y2 - size / 2, x2 + size / 2, y2 + size / 2])
        return candidates

    def get_contours(self, img, req):
        img_hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
        if req.color == 'yellow':
            #Yellow Hue area tended to appear past the cube's area, so for Y. cubes move min. Saturation up to YELLOW_HSV_LOW[1]
            mask = hsv_filter_mask(img_hsv, hsv_range_low = YELLOW_HSV_LOW)
        else:
            mask = hsv_filter_mask(img_hsv)
        back = calc_back_proj(img_hsv, self.known_histograms[req.color][1].hist, True)
        back &= mask
        back_filt = cv2.medianBlur(back, 5)
        back_filt = back.copy()
        conts = cv2.findContours(back_filt, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)
        if DEBUG:
            conts_img = self.img.copy()
        else:
            conts_img = None
        return conts, conts_img, back, back_filt

        
    def detect_cubes_cb(self, req):
        if self.rgb_only_camera:
            vcap = cv2.VideoCapture(0)
            self.img = vcap.read()
            if not self.img[0]:
                rospy.logerr('Cannot capture RGB frame from VideoCapture')
            else:
                self.img = self.img[1]
        resp = DetectCubeResponse()
        rospy.loginfo('detect_cubes service called\n' + str(req))
        if self.img == None:
            rospy.logerr('ERROR: no RGB data available')
            resp = self.err_resp()
            return resp

        if not self.known_histograms.has_key(req.color):
            rospy.logerr('ERROR: unknown color: %s' % req.color)
            resp = self.err_resp()
            return resp

        if DETECT_METHOD == DETECT_METHOD_CONTOUR:
            conts, conts_img, back, back_filt = self.get_contours(self.img, req)
            cube_rects = self.detect_cubes_contour(conts_img, conts, back_filt, req)
        elif DETECT_METHOD == DETECT_METHOD_TEMPLATE:
            hsv_planes = cv2.split(img_hsv)
            cube_rects = self.detect_cubes_template(hsv_planes, req)
        else:
            raise Exception('Unknown detection method requested: %s' % DETECT_METHOD)

        if len(cube_rects) > 0:
            for c in cube_rects:
                resp.sizes.append(max(c[2], c[3]))
                u =  c[0] + c[2] / 2
                v =  c[1] + c[3] / 2
                pose = PoseStamped()
                if self.rgb_only_camera:
                    pose.pose.position.x = u
                    pose.pose.position.y = v
                    pose.pose.position.z = 0
                else:
                    for i in read_points(self.cloud, uvs=[[u, v]]):
                        p = i
                    pose.pose.position.x = p[0]
                    pose.pose.position.y = p[1]
                    pose.pose.position.z = p[2]
                resp.poses.append(pose)
            if DEBUG:
                pass

        else:
            c = (30, 30, self.img.shape[1] - 60, self.img.shape[0] - 60)
            resp.sizes.append(-1)
            pose = PoseStamped()
            pose.pose.position.x = -1
            pose.pose.position.y = -1
            resp.poses.append(pose)
            if DEBUG:
                print 'NOT FOUND'
        
        if DEBUG:
            cv2.imwrite('cub.png', self.img)
            if DETECT_METHOD == DETECT_METHOD_CONTOUR:
                cv2.imwrite('back_%04d.png' % self.rgb_frame_cnt, back)
                for c in cube_rects:
                    cv2.rectangle(conts_img, (c[0] - 3, c[1] - 3), \
                                            (c[0] + c[2], \
                                             c[1] + c[3]), RGB(255,255,255))
                cv2.imwrite('conts_%04d.png' % self.rgb_frame_cnt, conts_img)
                for c in cube_rects:
                    cv2.rectangle(self.img, c[0:2], (c[0] + c[2], c[1] + c[3]), RGB(255,255,255))
                cv2.imwrite('result_%04d.png' % self.rgb_frame_cnt, self.img)

        if DETECT_PERF:
            self.dperf_file.write('%d %d %d %d\n' % cube_rects[0])

        return resp

    def run(self):
        rospy.spin()

    def load_hue_histograms(self):
        for h in self.known_histograms.keys():
            hist = Histogram()
            hist.load(self.known_histograms[h][0])
            self.known_histograms[h][1] = hist
        for h in self.known_histograms:
            print h
            print self.known_histograms[h][1]

    def detect_cubes_contour(self, conts_img, conts, back, req):
        if DEBUG:
            print '------------'
        #Candidates: list of (bbox, conts_index)
        candidates = []
        #First simple geometrical filter
        for i in range(len(conts[0])):
            if len(conts[0][i]) < 20:
                continue
            bbox = cv2.boundingRect(conts[0][i])
            max_side = max(bbox[2], bbox[3])
            min_side = min(bbox[2], bbox[3])
            if 1.0 * min_side / max_side < 0.65 \
               or max_side > req.max_size or min_side < req.min_size:
                continue
            candidates.append((bbox, i))
            if DEBUG:
                color = RGB(randint(255), randint(255), randint(255))
                cv2.drawContours(conts_img, conts[0], i, color)
        #Second, choose that which is in sum more probable
        '''
        c = candidates[0]
        best_cand = 0
        max_prob = back[c[0]:c[0]+c[2], c[1]:c[1]+c[3]].sum() / (c[2] * c[3])
        best_rect = candidates[0]
        for i in range(len(candidates) - 1):
            c = candidates[i]
            prob = back[c[0]:c[0]+c[2], c[1]:c[1]+c[3]].sum() / (c[2] * c[3])
            if prob > max_prob:
                max_prob = prob
                best_cand = i
                best_rect = candidates[i]
        '''
        def cand_prob(c):
            return back[c[0][0]:c[0][0]+c[0][2], c[0][1]:c[0][1]+c[0][3]].sum() / (c[0][2] * c[0][3])
        candidates = sorted(candidates, key = cand_prob)
        if DEBUG:
            for i in range(len(candidates)):
                draw_debug_messages(conts_img, [str(i)], candidates[i][0][0:2])
        #Now, find strong edges
        #Last, check for blob size. A box's blob projection area must be at least 0.5 of the bounding box area
        def big_enough_cont(cont, bbox):
            return cv2.contourArea(cont) >= 0.5 * bbox[2] * bbox[3]
        cubes = [cand[0] for cand in candidates if big_enough_cont(conts[0][cand[1]], cand[0])]
        return cubes

    def rgb_cb(self, img_data):
        self.rgb_frame_cnt += 1
        if self.rgb_subscriber:#from ROS topic
            self.img = cv_image_from_ros_msg(img_data)
        else:#from video file
            self.img = img_data

    def cloud_cb(self, cloud):
       self.cloud = cloud
       
def do_detection(rgb_only_camera):
    ccd = CubeColorDetector(rgb_only_camera)
    ccd.set_rgb_topic(DEF_RGB_TOPIC)
    ccd.set_cloud_topic(DEF_CLOUD_TOPIC)
    ccd.load_hue_histograms()
    ccd.run()

def prepare():
    if DEBUG:
        try:
            os.mkdir(OUT_DIR)
            print 'Created %s' % OUT_DIR
        except OSError, e:
            if e.errno != errno.EEXIST:
                print 'prepare %s failed: %s' % (OUT_DIR, e)
                raise Exception('Fatal error')
            else:
                print '%s already exist' % OUT_DIR
        try:
            os.chdir(OUT_DIR)
            print 'Chd\'ed to %s' % OUT_DIR
        except OSError, e:
            print 'Chd\'ed to %s failed: %s' % (OUT_DIR, e)

if __name__ == '__main__':
    print 'REALDIR: ', realpath('.')
    rgb_only_camera = False
    try:
        if 'rgb_only_camera' in set(rospy.myargv()):
            rgb_only_camera = True
    except:
        pass
    prepare()
    do_detection(rgb_only_camera)


