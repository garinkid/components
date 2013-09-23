#!/usr/bin/env python
#******************************************************************************
# Copyright (c) 2013
# All rights reserved.
#
# Edufill project 
# Hochschule Bonn-Rhein-Sieg
# University of Applied Sciences
# Computer Science Department
#
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
# Author:
# Nirmal Giftsun, Elizaveta Shpieva, Alexey Ozhigov
# 
# Supervised by:
# Rhama Dwiputra, Bjoern Kahl
#
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
# This software is published under a dual-license: GNU Lesser General Public
# License LGPL 2.1 and BSD license. The dual-license implies that users of this
# code may choose which terms they prefer.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.
# * Neither the name of Locomotec nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License LGPL as
# published by the Free Software Foundation, either version 2.1 of the
# License, or (at your option) any later version or the BSD license.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License LGPL and the BSD license for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License LGPL and BSD license along with this program.
#
#******************************************************************************
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
from numpy.random import randint
from edufill_object_detection.srv import *
import tf

DETECT_CUBE_SERVICE = '/edufill_objdetector/detect_cubes'

def cube(color, min_size = 10, max_size = 100):
    cube_detector_srv = rospy.ServiceProxy(DETECT_CUBE_SERVICE , DetectCube) 
    print "wait for service: %s" % DETECT_CUBE_SERVICE   
    rospy.wait_for_service(DETECT_CUBE_SERVICE, 30)
    # call cube detection service
    req = DetectCubeRequest()
    req.color = color
    req.min_size = min_size
    req.max_size = max_size
    response = cube_detector_srv(req)
    objlist = []
    for item in response.poses:       
        x = item.pose.position.x
        y = item.pose.position.y
        z = item.pose.position.z
        qx = item.pose.orientation.x
        qy = item.pose.orientation.y
        qz = item.pose.orientation.z
        qw = item.pose.orientation.w
        rpy = tf.transformations.euler_from_quaternion([qx, qy, qz, qw])
        obj_pose = [x, y, z, rpy[0], rpy[1], rpy[2]]
        objlist.append(obj_pose)
    return objlist

if __name__ == '__main__':
    if len(argv) >= 2:
        print cube(argv[1])
    else:
        print cube('red')

