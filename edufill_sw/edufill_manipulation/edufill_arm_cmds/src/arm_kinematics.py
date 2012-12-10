#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_arm_cmds')

import rospy
import threading
import tf
import time
import math
import brics_actuator.msg
import geometry_msgs.msg
import kinematics_msgs.srv
import kinematics_msgs.msg
import sensor_msgs.msg
import arm_navigation_msgs.msg
import arm_navigation_msgs.srv
import edufill_arm_navigation.msg

class KinematicsSolver:

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


	def call_fk_solver(self, j1,j2,j3,j4,j5):
		configuration =[j1,j2,j3,j4,j5]
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
		pose = edufill_arm_navigation.msg.MoveToCartesianPoseGoal()
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


	def call_constraint_aware_ik_solver(self, x,y,z,roll,pitch,yaw,reference_frame):
		param = [x,y,z,roll,pitch,yaw,reference_frame]
		# convert to pose message
		pose = self.create_pose(param)

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
		joint_config = resp.solution.joint_state.position
		print joint_config
		if (resp.error_code.val == arm_navigation_msgs.msg.ArmNavigationErrorCodes.SUCCESS):
			rospy.loginfo("IK solution found")
			jp = brics_actuator.msg.JointPositions()
			for i in range(len(self.joint_names)):
				jv = brics_actuator.msg.JointValue()
				jv.joint_uri = self.joint_names[i]
				jv.value = joint_config[i]
				jv.unit = self.unit
				jp.positions.append(jv)
			return jp
		else:
			return None


if __name__ == "__main__":
	rospy.init_node('youbot_kinematic_solver')
	time.sleep(0.5)
	ks = KinematicsSolver()
	# constraint aware kinematics
	(conf) = ks.call_constraint_aware_ik_solver(0.024 + 0.033,0,0.535,0,0,0,"/base_link")
	if (conf):
		print("IK solver found a solution")
		print conf.positions
	else:
		print("IK solver didn't find a solution")
	cartesian_pose = ks.call_fk_solver(conf.positions[0].value,conf.positions[1].value,conf.positions[2].value,conf.positions[3].value,conf.positions[4].value)
	print cartesian_pose


