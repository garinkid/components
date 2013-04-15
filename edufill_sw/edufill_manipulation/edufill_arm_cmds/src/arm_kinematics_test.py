#!/usr/bin/env python

from arm_kinematics import *
from arm_kinematics_geometrical_solution import *
import move_arm_component


class KinematicsSolver:

	def __init__(self,solver):
		# self.geometrical_ik_solution  = GeometricalSolver
		# self.analitical_ik_solution = AnalyticalSolver

		self.ik_solution = solver



	def to_cartesian_pose(self,xyzrpy,reference_frame):
		iksolver_state = self.ik_solution.check_ik_solver_has_solution(xyzrpy,reference_frame)
		if (iksolver_state):
			ik_result = self.ik_solution.get_ik_solution(xyzrpy,reference_frame)
			status_move = move_arm_component.to_joint_positions(ik_result)
			return status_move          
		else:
			return 'no solution found'

	def check_ik_solver_has_solution(self,xyzrpy,reference_frame):
		return self.ik_solution.check_ik_solver_has_solution(xyzrpy,reference_frame)

	def get_ik_solution(self,xyzrpy,reference_frame):
		joint_angles = self.ik_solution.get_ik_solution(xyzrpy,reference_frame)
		return joint_angles




if __name__=="__main__":
	rospy.init_node('verova_kinematic_solver')


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
