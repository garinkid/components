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
import roslib; roslib.load_manifest('edufill_arm_cmds')
import rospy
import brics_actuator.msg
import actionlib
import sys
import tf
import math
import edufill_srvs.srv
import std_srvs.srv
import os
# msg imports
from geometry_msgs.msg import *
from move_base_msgs.msg import *
from nav_msgs.msg import *
from sensor_msgs.msg import *
# Move arm to a joint position

# Move arm to a given joint positions                    
def arm_joint_positions():
    joint_srv = rospy.ServiceProxy('/read_arm_joint_position', edufill_srvs.srv.ReadJointPositions) 
    # call base placement service
    try:
        #print "wait for service: read_odometry_data"   
        rospy.wait_for_service('read_arm_joint_position', 5)
        response = joint_srv()
        joint_positions = [None]*len(response.joint_positions)
        for i in range(len(response.joint_positions)):
            joint_positions[i] = response.joint_positions[i]
    except Exception, e:
        rospy.loginfo('%s',e)
        joint_positions = []
    response = joint_positions
    return response


def gripper_joint_positions():
    robot = os.getenv('ROBOT')
    if robot == 'youbot-edufill':
        joint_srv = rospy.ServiceProxy('/read_gripper_joint_position', edufill_srvs.srv.ReadJointPositions) 
        # call base placement service
        try:
            #print "wait for service: read_odometry_data"   
            rospy.wait_for_service('read_arm_joint_position', 5)
            response = joint_srv()
        except Exception, e:
            rospy.loginfo('%s',e)
        joint_positions = [None]*len(response.joint_positions)
        for i in range(len(response.joint_positions)):
            joint_positions[i] = response.joint_positions[i]
        response = joint_positions
    else:
        response=[]
        rospy.loginfo('The robot has no gripper to read positions')
    return response
  


if __name__ == '__main__':
    i =0
    while i<10:
    	joint_positions()
        i = i+1
        
