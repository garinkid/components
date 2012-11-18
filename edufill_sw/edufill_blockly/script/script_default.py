#!/usr/bin/env python

import roslib; roslib.load_manifest("edufill_blockly")
import rospy
import brics_actuator.msg
from brics_actuator.msg import JointPositions, JointValue, Poison

def move_gripper(mode):
  #Open or close the gripper
  #https://github.com/youbot-hackathon/youbot-apps/blob/6b52b70cbdbbd0342919b7ebfe8caa2888bb3bc3/youbot_examples/nodes/simple_gripper_joints.py
  pub = rospy.Publisher("/arm_1/gripper_controller/position_command", JointPositions)
  rospy.init_node("simple_gripper_joint_position")
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


if __name__=="__main__":
  move_gripper("OPEN")
