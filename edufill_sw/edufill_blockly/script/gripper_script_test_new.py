#!/usr/bin/env python

#default import
import roslib; roslib.load_manifest("edufill_blockly")
import rospy

#blockly block dependent import
import move_gripper_component  #/edufill_manipulation/edufill_arm_cmds/src/move_gripper_component.py

if __name__=="__main__":
  move_gripper_component.move("OPEN") # blockly code
