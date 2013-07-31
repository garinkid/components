#!/usr/bin/env python
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
		try:
			return self.ik_solution.check_ik_solver_has_solution(xyzrpy,reference_frame)
		except:
			rospy.logerr("The robot has no requested functionality")

	def get_ik_solution(self,xyzrpy,reference_frame):
		joint_angles = []
		try:
			joint_angles = self.ik_solution.get_ik_solution(xyzrpy,reference_frame)
		except:
			rospy.logerr("The robot has no requested functionality/the solver does not have any solution")
		return joint_angles
	def get_fk_solution(self, joint_config):
                fk_solution = []
                try:
                        fk_solution = self.ik_solution.get_fk_solution(joint_config)
                except:
                        rospy.logerr("The robot has no requested functionality/the solver does not have any solution")
                return fk_solution


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
