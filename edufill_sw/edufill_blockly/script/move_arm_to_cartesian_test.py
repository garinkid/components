#!/usr/bin/env python

#default import
import roslib; roslib.load_manifest("edufill_blockly")
import rospy
import move_arm_component  #import component
from arm_kinematics_test import *

# move_arm_component example script

if __name__=="__main__":
	rospy.init_node('move_arm_component_test')
	kinematics_solver = KinematicsSolver(GeometricalSolver())
	kinematics_solver.to_cartesian_pose([0.057, 0, 0.535, 0, 0, 0], "/arm_link_0")


	if kinematics_solver.check_ik_solver_has_solution([0.057, 0, 0.535, 0, 0, 0], "/arm_link_0"):
		joint_angles = kinematics_solver.get_ik_solution([0.057, 0, 0.535, 0, 0, 0], "/arm_link_0")
		move_arm_component.to_joint_positions(joint_angles)
		ik_result = True
		print ik_result
	else:
		ik_result = False
		print ik_result