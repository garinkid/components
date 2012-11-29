#!/usr/bin/env python

import roslib; roslib.load_manifest("edufill_blockly")
import rospy
import move_arm_joint_position_component  #/edufill_manipulation/edufill_arm_cmds/src/move_arm_joint_position_component.py


if __name__=="__main__":
  move_arm_joint_position_component.pose("arm_out_of_view")
