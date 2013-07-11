#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_youbot_arm_analytical_solution')
import rospy
import threading
import tf
import time
import math
import brics_actuator.msg
import geometry_msgs.msg
import kinematics_msgs.srv
import kinematics_msgs.msg
from sensor_msgs.msg import *
import arm_navigation_msgs.msg
import arm_navigation_msgs.srv
import edufill_msg.msg
#import edufill_arm_navigation.msg

import tf
import tf.transformations
from std_msgs.msg import Header

class youbot_arm_analytical_solver:

	def __init__(self):
		self.joint_names = ["arm_joint_1", "arm_joint_2", "arm_joint_3", "arm_joint_4", "arm_joint_5"]
		self.configuration = [0, 0, 0, 0, 0]
		self.received_state = False
		self.unit = 'rad'

		rospy.Subscriber('/joint_states', sensor_msgs.msg.JointState, self.joint_states_callback)
		
		rospy.loginfo("Waiting for 'get_fk' service")
		rospy.wait_for_service("/youbot_arm_kinematics/get_fk")
		self.fk_solver = rospy.ServiceProxy("/youbot_arm_kinematics/get_fk", kinematics_msgs.srv.GetPositionFK)
		rospy.loginfo("Service 'get_fk' is ready")

		rospy.loginfo("Waiting for 'get_ik' service")
		rospy.wait_for_service('/youbot_arm_kinematics/get_ik')
		self.iks = rospy.ServiceProxy('/youbot_arm_kinematics/get_ik', kinematics_msgs.srv.GetPositionIK)
		rospy.loginfo("Service 'get_ik' is ready")

		rospy.loginfo("Waiting for 'get_constraint_aware_ik' service")
		rospy.wait_for_service('/youbot_arm_kinematics/get_constraint_aware_ik')
		self.ciks = rospy.ServiceProxy('/youbot_arm_kinematics/get_constraint_aware_ik', kinematics_msgs.srv.GetConstraintAwarePositionIK)
		rospy.loginfo("Service 'get_constraint_aware_ik' is ready")
		
		rospy.loginfo("Waiting for 'set_planning_scene_diff' service")
		rospy.wait_for_service('/environment_server/set_planning_scene_diff')
		self.planning_scene = rospy.ServiceProxy('/environment_server/set_planning_scene_diff', arm_navigation_msgs.srv.SetPlanningSceneDiff)
		rospy.loginfo("Service 'set_planning_scene_diff'")

		# a planning scene must be set before using the constraint-aware ik!
		self.send_planning_scene()

		self.listener = tf.TransformListener()


	#callback function: when a joint_states message arrives, save the values
	def joint_states_callback(self, msg):
		for k in range(5):
			for i in range(len(msg.name)):
				joint_name = "arm_joint_" + str(k + 1)
				if(msg.name[i] == joint_name):
					self.configuration[k] = msg.position[i]
		self.received_state = True


	def send_planning_scene(self):
		rospy.loginfo("Sending planning scene")
		
		req = arm_navigation_msgs.srv.SetPlanningSceneDiffRequest()
		res = self.planning_scene.call(req)


	def get_fk_solution(self, joint_config):
		#configuration =[joint_config[0],joint_config[1],joint_config[2],joint_config[3],joint_config[4]]
                configuration = joint_config
		while(not self.received_state):
			time.sleep(0.1)
		req = kinematics_msgs.srv.GetPositionFKRequest()
		req.header.frame_id = "base_link"
		req.header.stamp = rospy.Time.now()
		req.fk_link_names.append("arm_link_5")
		req.robot_state.joint_state.name = self.joint_names
		req.robot_state.joint_state.position = configuration
		try:
			resp = self.fk_solver(req)
		except rospy.ServiceException, e:
			rospy.logerr("Service did not process request: %s", str(e))
		
		if (resp.error_code.val == arm_navigation_msgs.msg.ArmNavigationErrorCodes.SUCCESS):
			return (resp.pose_stamped[0], True)
		else:
			return (geometry_msgs.msg.PoseStamped(), False)
		

	def call_ik_solver(self, goal_pose):
		while(not self.received_state):
			time.sleep(0.1)
		req = kinematics_msgs.srv.GetPositionIKRequest()
		req.timeout = rospy.Duration(0.5)
		req.ik_request.ik_link_name = "arm_link_5"
		req.ik_request.ik_seed_state.joint_state.name = self.joint_names
		req.ik_request.ik_seed_state.joint_state.position = self.configuration
		req.ik_request.pose_stamped = goal_pose
		try:
			resp = self.iks(req)
		except rospy.ServiceException, e:
			rospy.logerr("Service did not process request: %s", str(e))
		print resp.solution.joint_state.position
		return (resp.solution.joint_state.position, resp.error_code.val == arm_navigation_msgs.msg.ArmNavigationErrorCodes.SUCCESS)

	def create_pose(self, param):
		pose = edufill_msg.msg.MoveToCartesianPoseGoal()
		pose.goal.header.stamp = rospy.Time.now()
		pose.goal.header.frame_id = param[6]
		pose.goal.pose.position.x = param[0]
		pose.goal.pose.position.y = param[1]
		pose.goal.pose.position.z = param[2]

		(qx, qy, qz, qw) = tf.transformations.quaternion_from_euler(param[3], param[4], param[5])
		pose.goal.pose.orientation.x = qx
		pose.goal.pose.orientation.y = qy
		pose.goal.pose.orientation.z = qz
		pose.goal.pose.orientation.w = qw
		return pose


	def call_constraint_aware_ik_solver(self, param_list):
		# convert to pose message
		pose = self.create_pose(param_list)
		while (not self.received_state):
			time.sleep(0.1)
		req = kinematics_msgs.srv.GetConstraintAwarePositionIKRequest()
		req.timeout = rospy.Duration(0.5)
		req.ik_request.ik_link_name = "arm_link_5"
		req.ik_request.ik_seed_state.joint_state.name = self.joint_names
		req.ik_request.ik_seed_state.joint_state.position = self.configuration
		req.ik_request.pose_stamped = pose.goal
		try:
			resp = self.ciks(req)
		except rospy.ServiceException, e:
			rospy.logerr("Service did not process request: %s", str(e))				
		return resp


	def check_ik_solver_has_solution(self, xyzrpy,reference_frame):
		param = [xyzrpy[0],xyzrpy[1],xyzrpy[2],xyzrpy[3],xyzrpy[4],xyzrpy[5],reference_frame]
		response = self.call_constraint_aware_ik_solver(param)
		if (response.error_code.val == arm_navigation_msgs.msg.ArmNavigationErrorCodes.SUCCESS):
			return True
		else:
			return False

	def get_ik_solution(self, xyzrpy,reference_frame):
		param = [xyzrpy[0],xyzrpy[1],xyzrpy[2],xyzrpy[3],xyzrpy[4],xyzrpy[5],reference_frame]
		response = self.call_constraint_aware_ik_solver(param)
		joint_config = response.solution.joint_state.position
		if (response.error_code.val == arm_navigation_msgs.msg.ArmNavigationErrorCodes.SUCCESS):
			joint_config = response.solution.joint_state.position
		else:
			joint_config = []
		return joint_config

if __name__ == "__main__":
        a = (1,3,2)
        b =[a[0],a[1],a[2]]
        print b
	rospy.init_node('youbot_kinematic_solver')
	time.sleep(0.5)
	ks = KinematicsSolver()
	# constraint aware kinematics
	xyzrpy = [0.024 + 0.033,0,0.535,0,0,0];
	iksolver_state = ks.check_ik_solver_has_solution(xyzrpy,"/base_link")
	if (iksolver_state):
		ik_solution = ks.get_ik_solution(xyzrpy,"/base_link")
		print ik_solution
	else:
		print("IK solver didn't find a solution")
        ik_solution_list = [ik_solution[0],ik_solution[1],ik_solution[2],ik_solution[3],ik_solution[4]]
	cartesian_pose = ks.get_fk_solution(ik_solution_list)
	print cartesian_pose


