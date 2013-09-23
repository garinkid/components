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
import roslib; roslib.load_manifest('edufill_nxt_arm_geometrical_solution')
import rospy
import threading
import tf
import time
import math
import geometry_msgs.msg
import kinematics_msgs.srv
import kinematics_msgs.msg
from sensor_msgs.msg import *
import edufill_nxt_arm_geometrical_solution.srv

class nxt_arm_geometrical_solver:

	def __init__(self):
		self.joint_names = ["arm_joint_1", "arm_joint_2", "arm_joint_3"]
		self.configuration = [0, 0, 0]
		self.received_state = False
		self.unit = 'rad'
		
		rospy.loginfo("Waiting for 'get_ik' service")
		rospy.wait_for_service("/edufill_nxt_arm_geometrical_solution/ik_service")
		self.nxt_ik_solver = rospy.ServiceProxy("edufill_nxt_arm_geometrical_solution/ik_service", edufill_nxt_arm_geometrical_solution.srv.ik_service)
		rospy.loginfo("Service edufill_nxt_arm_geometrical_solution/ik_service is ready")


	def nxt_ik_solver(self, param_list):
		# convert to pose message
		req = edufill_nxt_arm_geometrical_solution.srv.ik_serviceRequest()
		req.xyz[0] = param_list[0]
		req.xyz[1] = param_list[1]
		req.xyz[2] = param_list[2]
		try:
			resp = self.self.nxt_ik_solver(req)
		except rospy.ServiceException, e:
			rospy.logerr("Service did not process request: %s", str(e))
		return resp


	def check_ik_solver_has_solution(self, xyzrpy,reference_frame):
		param = [xyzrpy[0],xyzrpy[1],xyzrpy[2]]
		response = self.nxt_ik_solver(param)
		num_sols = len(response.joint_values)/4 
		if (num_sols >0):
			return True
		else:
			return False


	def get_ik_solution(self, xyzrpy,reference_frame):
		param = [xyzrpy[0],xyzrpy[1],xyzrpy[2]]
		response = self.nxt_ik_solver(param)
		jv = response.joint_values
		num_sols = len(jv)/4 
		if (num_sols >0):
			joint_config = [jv[0],jv[1],jv[2]]
		else:
			joint_config = []
		return joint_config

if __name__ == "__main__":
		print 'done'
