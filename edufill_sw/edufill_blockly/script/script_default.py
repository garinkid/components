#!/usr/bin/env python

import roslib; roslib.load_manifest("edufill_blockly")
import rospy
import move_gripper_component  #/edufill_manipulation/edufill_arm_cmds/src/move_gripper_component.py


if __name__=="__main__":
  rospy.init_node('edufill_blockly_node')

  move_gripper_component.move("OPEN")
