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
import rospy
import roslib; roslib.load_manifest('edufill_arm_cmds') 
import math
import brics_actuator
import os
from sensor_msgs.msg import JointState
from brics_actuator.msg import JointVelocities, JointPositions, JointValue, Poison 

def publish_to_youbot(jointState):
    pub = rospy.Publisher('arm_1/arm_controller/position_command', JointPositions)
    rospy.sleep(0.5) 
    try:
        jp = JointPositions()
        
        jv1 = JointValue()
        jv1.joint_uri = jointState.name[0]
        jv1.value = jointState.position[0]
        jv1.unit = "rad"
        
        jv2 = JointValue()
        jv2.joint_uri = jointState.name[1]
        jv2.value = jointState.position[1]
        jv2.unit = "rad"

        jv3 = JointValue()
        jv3.joint_uri = jointState.name[2]
        jv3.value = jointState.position[2]
        jv3.unit = "rad"
        
        jv4 = JointValue()
        jv4.joint_uri = jointState.name[3]
        jv4.value = jointState.position[3]
        jv4.unit = "rad"
        
        jv5 = JointValue()
        jv5.joint_uri = jointState.name[4]
        jv5.value = jointState.position[4]
        jv5.unit = "rad"
        
        p = Poison()
        #print p
       
        jp.poisonStamp = p
        
        jp.positions = [jv1, jv2, jv3, jv4, jv5]
        
        pub.publish(jp)

        return 'arm moved successfully'

    except Exception, e:
        print e
        return 'arm move failure'

def publish_to_nxt(jointState):
    pub = rospy.Publisher('position_controller', JointState)
    rospy.sleep(0.5) 
    try:
        gear_ratios = [7, 5, 5]
        # Create msg
        jp = JointState()
        jp.name = [None]*3
        jp.position = [None]*3
        # Fill messag
        jp.name[0] = jointState.name[0]
        jp.position[0] = (jointState.position[0]) * gear_ratios[0]
        jp.name[1] = jointState.name[1]
        jp.position[1] = (jointState.position[1]) * gear_ratios[1]
        jp.name[2] = jointState.name[2]
        jp.position[2] =  (jointState.position[2]) * gear_ratios[2]
        r = rospy.Rate(500)
        for c in range(1,5):
            pub.publish(jp)
            r.sleep()
        return 'arm moved successfully'
    except Exception, e:
        print e
        return 'arm move failure'

def handler_callback(data):
	
	robot = os.getenv('ROBOT')
	rospy.loginfo(robot)
	if robot == 'youbot-edufill':
		publish_to_youbot(data)
	else:
		publish_to_nxt(data)

def handler():
	rospy.init_node('arm_controller_handler', anonymous=True)
	rospy.Subscriber("arm_controller_handler/position_command", JointState, handler_callback)
	rospy.spin()

if __name__ == '__main__':
  handler()
    
