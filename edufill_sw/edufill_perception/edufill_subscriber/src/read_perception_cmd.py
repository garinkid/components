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
import roslib; roslib.load_manifest('edufill_subscriber')
import rospy
import brics_actuator.msg
import actionlib
import sys
import tf
import math
import edufill_srvs.srv
import std_srvs.srv
import os
from geometry_msgs.msg import *
from move_base_msgs.msg import *
from nav_msgs.msg import *
from sensor_msgs.msg import *
from nxt_msgs.msg import Range

class youbot_subscriber:
    def __init__(self):
    	# setting up variables for message subscription 
        self.joint_names = ["arm_joint_1", "arm_joint_2", "arm_joint_3", "arm_joint_4", "arm_joint_5"]
        self.gripper_names = ["gripper_finger_joint_l","gripper_finger_joint_r"]
        self.arm_configuration = [0, 0, 0, 0, 0]
        self.gripper_configuration = [0, 0]
        self.received_state = False
        self.odom_data = nav_msgs.msg.Odometry()
        self.arm_joint_positions = nav_msgs.msg.Odometry()
        self.laser_scan_data = sensor_msgs.msg.LaserScan()

        # services for advertising perception messages
        self.read_odom_server = rospy.Service('read_odometry_data', edufill_srvs.srv.ReadOdom, self.read_odometry_data)
        self.read_arm_joint_position_server = rospy.Service('read_arm_joint_position', edufill_srvs.srv.ReadJointPositions,self.read_arm_joint_positions)
        self.read_arm_joint_position_server = rospy.Service('read_gripper_joint_position', edufill_srvs.srv.ReadJointPositions,self.read_gripper_joint_positions)
        self.read_laser_scan_server = rospy.Service('read_laser_scan_data', edufill_srvs.srv.ReadLaserScan, self.read_laser_scan_data)


        # subscribers sensor_msgs/LaserScan
        self.jointstate_sub = rospy.Subscriber('/joint_states', sensor_msgs.msg.JointState, self.joint_states_callback)
        self.odometry_sub = rospy.Subscriber('/odom', nav_msgs.msg.Odometry, self.odom_callback)
        self.laser_data_sub = rospy.Subscriber('/scan_front', sensor_msgs.msg.LaserScan, self.laser_scan_callback)

    def joint_states_callback(self,msg):
		for k in range(5):
			for i in range(len(msg.name)):
				joint_name = self.joint_names[k]
				if(msg.name[i] == joint_name):
					self.arm_configuration[k] = msg.position[i]
					self.received_state = True
		for k in range(2):
			for i in range(len(msg.name)):
				gripper_name = self.joint_names[k]
				if(msg.name[i] == gripper_name):
					self.gripper_configuration[k] = msg.position[i]
					self.received_state = True

    def odom_callback(self,msg):
        self.odom_data = msg

    def laser_scan_callback(self,msg):
        self.laser_scan_data = msg


    def read_arm_joint_positions(self,req):
        return edufill_srvs.srv.ReadJointPositionsResponse(self.arm_configuration)

    def read_gripper_joint_positions(self,req):
        return edufill_srvs.srv.ReadJointPositionsResponse(self.gripper_configuration)

    def read_odometry_data(self,req):
        return edufill_srvs.srv.ReadOdomResponse(self.odom_data)

    def read_laser_scan_data(self,req):
        return edufill_srvs.srv.ReadLaserScanResponse(self.laser_scan_data)
      
class nxt_subscriber:
	def __init__(self):
    # setting up variables for message subscription 
		self.joint_names = ["arm_joint_1", "arm_joint_2", "arm_joint_3"]
		self.configuration = [0, 0, 0]
		self.gears_ratio = [7, 5, 5]
		self.received_state = False
		self.odom_data = nav_msgs.msg.Odometry()
		self.arm_joint_positions = nav_msgs.msg.Odometry()
		self.ultrasonic_sensor = Range()
        # services for advertising perception messages
		self.read_odom_server = rospy.Service('read_odometry_data', edufill_srvs.srv.ReadOdom, self.read_odometry_data)
		self.read_arm_joint_position_server = rospy.Service('read_arm_joint_position', edufill_srvs.srv.ReadJointPositions,self.read_arm_joint_positions)
		self.read_ultrasonic_sensor_server = rospy.Service('read_ultrasonic_sensor', edufill_srvs.srv.ReadUltrasonic, self.read_ultrasonic_data)

	# subscribers sensor_msgs/LaserScan
		self.jointstate_sub = rospy.Subscriber('/joint_states', sensor_msgs.msg.JointState, self.joint_states_callback)
		self.odometry_sub = rospy.Subscriber('/odom', nav_msgs.msg.Odometry, self.odom_callback)
		self.ultrasonic_data_sub = rospy.Subscriber("ultrasonic_sensor", Range, self.ultra_msg_callback)

	def joint_states_callback(self,msg):
		for k in range(3):
			for i in range(len(msg.name)):
				joint_name = self.joint_names[k]
				if(msg.name[i] == joint_name):
					self.configuration[k] = msg.position[i] / self.gears_ratio[i]
					self.received_state = True

	def odom_callback(self,msg):
		self.odom_data = msg

	def ultra_msg_callback(self,msg):
		self.ultrasonic_sensor = msg

	def read_arm_joint_positions(self,req):
		return edufill_srvs.srv.ReadJointPositionsResponse(self.configuration)

	def read_odometry_data(self,req):
		return edufill_srvs.srv.ReadOdomResponse(self.odom_data)

	def read_ultrasonic_data(self,req):
		return edufill_srvs.srv.ReadUltrasonicResponse(self.ultrasonic_sensor)

if __name__ == '__main__':
	rospy.init_node('read_perception_cmd')
	robot = os.getenv('ROBOT')
	rospy.loginfo(robot)
	if robot == 'youbot-edufill':
		s = youbot_subscriber()
	else:
		s = nxt_subscriber()
	rospy.spin() 


