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
import roslib; roslib.load_manifest('edufill_base_cmds')
import rospy
import brics_actuator.msg
import actionlib
import sys
import tf
import math
import edufill_srvs.srv
import std_srvs.srv
# msg imports
from geometry_msgs.msg import *
from move_base_msgs.msg import *
from nav_msgs.msg import *


def odometry():
    odom_srv = rospy.ServiceProxy('/read_odometry_data', edufill_srvs.srv.ReadOdom) 
    print "wait for service: read_odometry_data"   
    rospy.wait_for_service('read_odometry_data', 30)
    # call base placement service
    res = odom_srv()
    pose = res.odom_data.pose.pose
    rot = (pose.orientation.x,pose.orientation.y,pose.orientation.z,pose.orientation.w)
    angles = tf.transformations.euler_from_quaternion(rot)
    response = [pose.position.x,pose.position.y,pose.position.z,angles[0],angles[1],angles[2]]
    return response
    

def location():
    tf_listener = tf.TransformListener()
    transforms_received = False
    while(not transforms_received):
        try:
            tf_listener.waitForTransform('map', '/base_link', rospy.Time.now(), rospy.Duration(1))
            (trans, rot) = tf_listener.lookupTransform('/map', '/base_link', rospy.Time(0))
            location = PoseStamped()
            location.pose.position.x = trans[0]
            location.pose.position.y = trans[1]
            location.pose.position.z = trans[2]
            location.pose.orientation.x = rot[0] 
            location.pose.orientation.y = rot[1] 
            location.pose.orientation.z = rot[2] 
            location.pose.orientation.w = rot[3] 
            transforms_received = False
	    return location
        except Exception, e:
            rospy.sleep(1)
            print 'trying to get tf'
            transforms_received = False

if __name__ == '__main__':
    rospy.init_node('readbase',disable_signals=False)
    Odometry = odometry()
    print Odometry





    



