#! /usr/bin/python

import rospy 
import brics_actuator.msg
from brics_actuator.msg import JointPositions, JointValue, Poison

#Open or close the gripper
def move(mode):
	pub = rospy.Publisher("/arm_1/gripper_controller/position_command", JointPositions)
	rospy.init_node("move_gripper_component")
	rospy.sleep(0.5)
	if mode == "OPEN":
		gripper_value = 0.0115
	else:
		gripper_value = 0
	try:
		jp = JointPositions()

		jv1 = JointValue()
		jv1.joint_uri = "gripper_finger_joint_l"
		jv1.value = gripper_value
		jv1.unit = "m"
		jv2 = JointValue()
		jv2.joint_uri = "gripper_finger_joint_r"
	 	jv2.value = gripper_value
		jv2.unit = "m"
		p = Poison()
	 	jp.poisonStamp = p

		jp.positions = [jv1, jv2] #list

		pub.publish(jp)

		rospy.sleep(1.0)
	except Exception, e:
		print e


