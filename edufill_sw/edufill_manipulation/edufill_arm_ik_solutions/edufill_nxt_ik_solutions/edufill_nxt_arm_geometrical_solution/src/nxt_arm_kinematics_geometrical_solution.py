#!/usr/bin/env python
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
