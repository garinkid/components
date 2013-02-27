#!/usr/bin/env python

import roslib; roslib.load_manifest("edufill_blockly")
import rospy
import move_gripper_component #/edufill_manipulation/edufill_arm_cmds/src/move_gripper_component.py
import brics_actuator.msg
from brics_actuator.msg import JointPositions, JointValue, Poison

pub = None
err = None

def create_gripper_msg (left_gripper, right_gripper):
  jp = JointPositions()
  jv1 = JointValue()
  jv1.joint_uri = "gripper_finger_joint_l"
  jv1.value = left_gripper
  jv1.unit = "m"
  jv2 = JointValue()
  jv2.joint_uri = "gripper_finger_joint_r"
  jv2.value = right_gripper
  jv2.unit = "m"
  p = Poison()
  jp.poisonStamp = p

  jp.positions = [jv1, jv2]

  return jp


if __name__=="__main__":
  rospy.init_node('edufill_blockly_node')

  print('high level open ')
  move_gripper_component.move("OPEN")
  print('high level close')
  move_gripper_component.move("CLOSE")
  print('mid level open, close, in between')
  move_gripper_component.to_joint_positions([0.0115, 0.0115])
  print('mid level close')
  move_gripper_component.to_joint_positions([0, 0])
  print('mid level in between')
  move_gripper_component.to_joint_positions([0.0075, 0.0075])
  print('low level close')
  pub = rospy.Publisher('arm_1/gripper_controller/position_command', JointPositions)
  rospy.sleep(0.5)
  try:
    pub.publish(create_gripper_msg(0, 0))
  except err:
    print(err)
  print('low level open')
  rospy.sleep(0.5)
  try:
    pub.publish(create_gripper_msg(0.0115, 0.0115))
  except err:
    print(err)
  print('test finish')
