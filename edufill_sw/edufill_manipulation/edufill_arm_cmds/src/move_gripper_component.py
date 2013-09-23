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
import roslib
import os
roslib.load_manifest('edufill_arm_cmds')
from brics_actuator.msg import JointPositions, JointValue, Poison

#open or close the gripper
def to_pose(command):
    if isinstance(command,str):
        if command == "open":
          gripper_value = 0.0115  
        elif command == "close":
          gripper_value = 0
    else:
            return 'wrong_command'
    to_joint_positions([gripper_value,gripper_value])

#control the gripper by gripper positions
def to_joint_positions(gripper_positions):
		robot = os.getenv('ROBOT')
		if robot == 'youbot-edufill':
				left_gripper_val = gripper_positions[0]
				right_gripper_val = gripper_positions[1]
				pub = rospy.Publisher("/arm_1/gripper_controller/position_command", JointPositions)
				rospy.sleep(0.5)
				try:
						jp = JointPositions()
						jv1 = JointValue()
						jv1.joint_uri = "gripper_finger_joint_l"
						jv1.value = left_gripper_val
						jv1.unit = "m"
						jv2 = JointValue()
						jv2.joint_uri = "gripper_finger_joint_r"
						jv2.value = right_gripper_val
						jv2.unit = "m"
						p = Poison()
						jp.poisonStamp = p
						jp.positions = [jv1, jv2] #list
						pub.publish(jp)
						rospy.sleep(1.0)
						rospy.loginfo('Gripper control command published successfully')
				except Exception, e:
						rospy.loginfo('%s',e)
		else:
				rospy.loginfo('This robot does not have gripper functionality to control')



if __name__ == '__main__':
    # range : 0 - 0.0115 metres  
    rospy.init_node('move_gripper_component')
    to_joint_positions([0.0115,0.0115])
    


