#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_object_detection')
import rospy
from std_msgs.msg import Int64
from std_msgs.msg import String
from sensor_msgs.msg import Image
from geometry_msgs.msg import PoseStamped
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

DETECT_CUBE_SERVICE = '/edufill_objdetector/detect_cubes'

def cube(color, min_size = 10, max_size = 100):
    cube_detector_srv = rospy.ServiceProxy(DETECT_CUBE_SERVICE , DetectCube) 
    print "wait for service: %s" % DETECT_CUBE_SERVICE   
    rospy.wait_for_service(DETECT_CUBE_SERVICE, 30)
    # call base placement service
    req = DetectCubeRequest()
    req.color = color
    req.min_size = min_size
    req.max_size = max_size
    response = cube_detector_srv(req)
    return response

if __name__ == '__main__':
    print cube('red')

