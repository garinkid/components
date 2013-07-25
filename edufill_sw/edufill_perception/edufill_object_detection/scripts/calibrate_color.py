#!/usr/bin/env python

from myutils import GUICalibrateHSV
import numpy as np
import cv2
import os
from shutil import move
from time import time
import roslib
roslib.load_manifest('edufill_object_detection')
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

DEF_HSV_FILE = 'params/def_min_max_hsv.yaml'
CUR_HSV_FILE = 'params/cur_min_max_hsv.yaml'
RGB_TOPIC = '/tower_cam3d/rgb/image_color'
PARAM_HSV_YAML = '~hsv_file'

def get_image_from_topic(rgb_topic = RGB_TOPIC):
    msg = rospy.wait_for_message(rgb_topic, Image, 4)
    bridge = CvBridge()
    img = bridge.imgmsg_to_cv(msg, 'bgr8')
    np_img = np.asarray(img)
    return np_img
 
def do_calibrate_color(hsv_fname):
    from_topic = raw_input('Calibrate from %s [y/<another_topic>/f]? ' % RGB_TOPIC)
    if str(from_topic) == 'n':
        img_file = raw_input('Image file name? ')
        img = cv2.imread(img_file)
        if img == None: 
            raise Exception('Cannot load image %s' % img_file)
    elif str(from_topic) == 'y':
        img = get_image_from_topic()
    else:
        img = get_image_from_topic(from_topic)
        
    if os.path.isfile(os.getenv('ROS_HOME') + '/' + hsv_fname):
        ans = raw_input('%s already exist. Make a backup [y/n]? ' % hsv_fname)
        if ans == 'y':
            move(hsv_fname, hsv_fname + '_' + str(time()))
    GUICalibrateHSV(img, hsv_fname)

if __name__ == '__main__':
    rospy.init_node('edufill_calibrate_color')
    os.chdir(os.getenv('ROS_HOME'))
    hsv_fname = rospy.get_param(PARAM_HSV_YAML, DEF_HSV_FILE)
    if hsv_fname == DEF_HSV_FILE:
        rospy.logerr('Cannot use %s for configration. %s must be kept untouched as a default file.' % (hsv_fname, hsv_fname))
        exit(1)
    do_calibrate_color(hsv_fname)
