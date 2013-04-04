#!/usr/bin/env python

import roslib; roslib.load_manifest('edufill_object_detection')
import rospy
from std_msgs.msg import Int64
from std_msgs.msg import String
from sensor_msgs.msg import Image
from geometry_msgs.msg import Pose2D
from cv_bridge import CvBridge, CvBridgeError
import cv2
from cv2.cv import CV_FOURCC, RGB
import numpy as np
import os
from os.path import dirname, basename
from sys import exit, argv, stderr
from histogram import Histogram
from myutils import calc_back_proj, draw_cross, hsv_filter_mask, draw_debug_messages
from numpy.random import randint
from edufill_object_detection.srv import *

DEBUG = False
DETECT_PERF = False
DETECT_PERF_FILE = 'detect_perf.txt'
OUT_DIR = 'out/'

DEF_RGB_TOPIC    = '/camera/rgb/image_rect_color'
DEF_RES_SERVICE  = '/edufill_objdetector/detect_cube'

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
    def __init__(self):
        self.known_histograms = { 'red': ['../histograms/red_cube.hst', None], \
                                  'green': ['../histograms/green_cube.hst', None], \
                                  'blue': ['../histograms/blue_cube.hst', None], \
                                  'yellow': ['../histograms/yellow_cube.hst', None], \
                                  'cyan': ['../histograms/cyan_cube.hst', None], \
                                  'magenta': ['../histograms/magenta_cube.hst', None] }
        rospy.init_node('cube_color_detector', anonymous=True)
        self.hists = []
        self.img = None
        self.rgb_subscriber = None
        self.rgb_frame_cnt = 0
        self.res_service = rospy.Service(DEF_RES_SERVICE, DetectCube, self.detect_cube_cb)
        self.rgb = None
        if DETECT_PERF:
            self.dperf_file = file(DETECT_PERF_FILE, 'w')

    def set_rgb_topic(self, topic_name):
        self.rgb_subscriber = rospy.Subscriber(topic_name, Image, self.rgb_cb)

    def err_resp(self):
        resp = DetectCubeResponse()
        resp.size = -1
        resp.pose.x = -1
        resp.pose.y = -1
        return resp

    def detect_cube_cb(self, req):
        resp = DetectCubeResponse()
        rospy.loginfo('detect_cube service called\n' + str(req))
        if self.img == None:
            rospy.logerr('ERROR: no RGB data available')
            resp = self.err_resp()
            return resp

        if not self.known_histograms.has_key(req.color):
            rospy.logerr('ERROR: unknown color: %s' % req.color)
            resp = self.err_resp()
            return resp

        img_hsv = cv2.cvtColor(self.img, cv2.COLOR_BGR2HSV)
        mask = hsv_filter_mask(img_hsv)
        print self.known_histograms[req.color]
        back = calc_back_proj(img_hsv, self.known_histograms[req.color][1].hist, True)
        back &= mask
        back[np.where(back < 200)] = 0
        back_filt = cv2.medianBlur(back, 5)
        conts = cv2.findContours(back_filt, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)
        if DEBUG:
            conts_img = self.img.copy()
        else:
            conts_img = None

        try:
            cube_rect = self.detect_cube(conts_img, conts, back_filt, req)
            resp.size = max(cube_rect[2], cube_rect[3])
            resp.pose.x = cube_rect[0] + cube_rect[2] / 2
            resp.pose.y = cube_rect[1] + cube_rect[3] / 2
            if DEBUG:
                print cube_rect
        except IndexError, e:
            cube_rect = (30, 30, self.img.shape[1] - 60, self.img.shape[0] - 60)
            resp.size = -1
            resp.pose.x = -1
            resp.pose.y = -1
            if DEBUG:
                print 'NOT FOUND'
            
        if DEBUG:
            cv2.imwrite('cub.png', self.img)
            cv2.imwrite('back_%04d.png' % self.rgb_frame_cnt, back)
            cv2.rectangle(conts_img, (cube_rect[0] - 3, cube_rect[1] - 3), \
                                        (cube_rect[0] + cube_rect[2], \
                                         cube_rect[1] + cube_rect[3]), RGB(255,255,255))

            cv2.imwrite('conts_%04d.png' % self.rgb_frame_cnt, conts_img)
            cv2.rectangle(self.img, cube_rect[0:2], (cube_rect[0] + cube_rect[2], cube_rect[1] + cube_rect[3]), RGB(255,255,255))
            cv2.imwrite('result_%04d.png' % self.rgb_frame_cnt, self.img)

        if DETECT_PERF:
            self.dperf_file.write('%d %d %d %d\n' % cube_rect)

        if resp.size != -1:
            rospy.loginfo('Found cube:\n' + str(resp))
        else:
            rospy.loginfo('Cube not found')
        return resp

    def run(self):
        rospy.spin()

    def load_hue_histograms(self):
        hist = Histogram()
        for h in self.known_histograms.keys():
            hist.load(self.known_histograms[h][0])
            self.known_histograms[h][1] = hist

    def detect_cube(self, conts_img, conts, back, req):
        if DEBUG:
            print '------------'
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
            if DEBUG:
                print 'cand', bbox
            candidates.append(bbox)
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
            return back[c[0]:c[0]+c[2], c[1]:c[1]+c[3]].sum() / (c[2] * c[3])
        candidates = sorted(candidates, key = cand_prob)
        if DEBUG:
            for i in range(len(candidates)):
                draw_debug_messages(conts_img, [str(i)], candidates[i][0:2])
        return candidates[0]

    def rgb_cb(self, img_data):
        self.rgb_frame_cnt += 1
        if self.rgb_subscriber:#from ROS topic
            self.img = cv_image_from_ros_msg(img_data)
        else:#from video file
            self.img = img_data
       
def do_detection():
    ccd = CubeColorDetector()
    ccd.set_rgb_topic(DEF_RGB_TOPIC)
    ccd.load_hue_histograms()
    ccd.run()

def prepare():
    if DEBUG:
        try:
            os.mkdir(OUT_DIR)
        except:
            pass
    os.chdir(OUT_DIR)

if __name__ == '__main__':
    prepare()
    do_detection()
