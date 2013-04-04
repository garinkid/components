#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_arm_geometrical_solution')
import rospy
import threading
import tf
import time
import math

import edufill_srvs.srv
import geometry_msgs.msg
import sensor_msgs.msg
import rospy
import brics_actuator.msg
from brics_actuator.msg import JointVelocities, JointPositions, JointValue, Poison 

# import move_arm_component
import numpy



class KinematicsControl:

	def __init__(self):
		self.joint_names = ["arm_joint_1", "arm_joint_2", "arm_joint_3", "arm_joint_4", "arm_joint_5"]
		self.configuration = [0, 0, 0, 0, 0]
		self.received_state = False
		self.unit = 'rad'
		self.nvals = 0
		self.nsols = 0

		rospy.Subscriber('/joint_states', sensor_msgs.msg.JointState, self.joint_states_callback)
		self.iks = rospy.ServiceProxy('/edufill_arm_geometrical_solution/ComputeIK', edufill_srvs.srv.ComputeIK)


	#callback function: when a joint_states message arrives, save the values
	def joint_states_callback(self, msg):
		# print "joint_states_callback {0!s}".format(time.clock())
		for k in range(5):
			for i in range(len(msg.name)):
				joint_name = "arm_joint_" + str(k + 1)
				if(msg.name[i] == joint_name):
					self.configuration[k] = msg.position[i]
		# print self.configuration
		self.received_state = True

	def create_pose(self, param):
		# pose = edufill_msg.msg.MoveToCartesianPoseGoal()
		pose = geometry_msgs.msg.Pose()
		pose.position.x = param[0]
		pose.position.y = param[1]
		pose.position.z = param[2]

		(qx, qy, qz, qw) = tf.transformations.quaternion_from_euler(param[3], param[4], param[5])
		pose.orientation.x = qx
		pose.orientation.y = qy
		pose.orientation.z = qz
		pose.orientation.w = qw
		return pose

	def call_constraint_aware_ik_solver(self, param_list):
		req = edufill_srvs.srv.ComputeIKRequest()
		pose = self.create_pose(param_list)
		# print pose
		req.tool_pose = pose
		try:
			resp = self.iks(req)
		except rospy.ServiceException, e:
			rospy.logerr("Service did not process request: %s", str(e))				
		return resp

	def check_ik_solver_has_solution(self, xyzrpy):
		param = [xyzrpy[0],xyzrpy[1],xyzrpy[2],xyzrpy[3],xyzrpy[4],xyzrpy[5]]
		response = self.call_constraint_aware_ik_solver(param)
		self.nvals = len(response.joint_values);
		self.nsols = self.nvals/5;
		if (self.nsols > 0):
			return True
		else:
			return False

	def get_ik_solution(self, xyzrpy):
		while (not self.received_state):
			time.sleep(0.1)
		# print "get_ik_solution {0!s}".format(time.clock())
		param = [xyzrpy[0],xyzrpy[1],xyzrpy[2],xyzrpy[3],xyzrpy[4],xyzrpy[5]]
		response = self.call_constraint_aware_ik_solver(param)
		sum_joint_config = 0;
		joint_config = numpy.zeros(shape=(self.nsols,5))
		k = 0;
		sum_of_current_joints = reduce(lambda x, y: x + y, self.configuration)
		while (k<self.nvals):
			for i in range(0,self.nsols):
				for j in range(0,5):
					joint_config[i][j] = response.joint_values[k]
					k = k + 1 
				# 	sum_joint_config += joint_config[i][j]
				# print sum_joint_config
				# diff_solutions = abs(sum_of_current_joints - sum_joint_config);
				# if(diff_solutions < sum_joint_config):
				# 	sum_joint_config = diff_solutions
				# 	number_of_solution = i
				# 	print i
				# sum_joint_config= 0
		# smS = sum_joint_config;
		# for i in range(0,self.nsols):
		# 	for j in range(0,5):
		# 		sum_joint_config += joint_config[i][j];
		# 	diff_solutions = abs(sum_of_current_joints - sum_joint_config);
		# 	if(diff_solutions < smS):
		# 		smS = diff_solutions;
		# 		number_of_solution = i;
		# 	sum_joint_config= 0;

		return joint_config[0].tolist()


if __name__ == "__main__":
	rospy.init_node('verova_kinematic_solver')
	# time.sleep(2.5)
	ks = KinematicsControl()
	xyzrpy = [0.024 + 0.033,0,0.535,0,0,0]
	iksolver_state = ks.check_ik_solver_has_solution(xyzrpy)
	if (iksolver_state):
		ik_solution = ks.get_ik_solution(xyzrpy)
		print ik_solution
		# status_move = to_joint_positions(ik_solution)
		# return status_move          
	else:
		print 'no solution found'
		# return 'no solution found'