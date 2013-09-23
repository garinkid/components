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
from youbot_arm_kinematics_analytical_solution import *
from youbot_arm_kinematics_geometrical_solution import *
from nxt_arm_kinematics_geometrical_solution import *
import sys
import os


class KinematicsSolver:

	def __init__(self,solver): 
		if (os.getenv('ROBOT') == 'youbot-edufill'):
			self.robot_arm_ik_solver = 'youbot_arm_'+solver+'_solver'			
		elif (os.getenv('ROBOT') == 'nxt-arm'):
			self.robot_arm_ik_solver = 'nxt_arm_'+solver+'_solver'		
		current_module = sys.modules[__name__]
		#print dir(current_module)
		if(hasattr(current_module,self.robot_arm_ik_solver)):
			self.ik_solution = getattr(current_module,self.robot_arm_ik_solver)()
		else:
			raise Exception("The robot has no requested functionality")
      

	def check_ik_solver_has_solution(self,xyzrpy,reference_frame):
		'''
		try:
			return self.ik_solution.check_ik_solver_has_solution(xyzrpy,reference_frame)
		except:
			rospy.logerr("The robot has no requested functionality")
		'''
		return self.ik_solution.check_ik_solver_has_solution(xyzrpy,reference_frame)

	def get_ik_solution(self,xyzrpy,reference_frame):
		'''
		joint_angles = []
		try:
			joint_angles = self.ik_solution.get_ik_solution(xyzrpy,reference_frame)
		except:
			rospy.logerr("The robot has no requested functionality/the solver does not have any solution")
		'''
		joint_angles = self.ik_solution.get_ik_solution(xyzrpy,reference_frame)
		return joint_angles


if __name__=="__main__":
	rospy.init_node('verova_kinematic_solver')
	#kinematics_solver = KinematicsSolver(GeometricalSolver())
	#kinematics_solver.to_cartesian_pose([0.057, 0, 0.535, 0, 0, 0], "/arm_link_0")

	# if kinematics_solver.check_ik_solver_has_solution([0.057, 0, 0.535, 0, 0, 0], "/arm_link_0"):
	# 	joint_angles = kinematics_solver.get_ik_solution([0.057, 0, 0.535, 0, 0, 0], "/arm_link_0")
	# 	move_arm_component.to_joint_positions(joint_angles)
	# 	ik_result = True
	# 	print ik_result
	# else:
	# 	ik_result = False
	# 	print ik_result
