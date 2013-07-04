#!/usr/bin/env python

from myutils import GUICalibrateHSV
import numpy as np
import cv2
import os
from shutil import move
from time import time


RGB_TOPIC = '/tower_cam3d/rgb/image_color'

def get_image_from_topic():
    import roslib
    roslib.load_manifest('edufill_object_detection')
    import rospy
    from sensor_msgs.msg import Image
    from cv_bridge import CvBridge, CvBridgeError
    rospy.init_node('edufill_calibrate_color')
    msg = rospy.wait_for_message(RGB_TOPIC, Image, 4)
    bridge = CvBridge()
    img = bridge.imgmsg_to_cv(msg, 'bgr8')
    np_img = np.asarray(img)
    return np_img
 
def do_calibrate_color():
    from_topic = raw_input('Calibrate from %s [y/n]? ' % RGB_TOPIC)
    if str(from_topic) == 'n':
        img_file = raw_input('Image file name? ')
        img = cv2.imread(img_file)
        if img == None: 
            raise Exception('Cannot load image %s' % img_file)
    else:
        img = get_image_from_topic()
    fname = 'params/min_max_hsv.yaml'
    if os.path.isfile(os.getenv('ROS_HOME') + '/' + fname):
        ans = raw_input('%s already exist. Make a backup [y/n]? ' % fname)
        if ans == 'y':
            move(fname, fname + '_' + str(time()))
    GUICalibrateHSV(img, fname)

if __name__ == '__main__':
    os.chdir(os.getenv('ROS_HOME'))
    do_calibrate_color()
