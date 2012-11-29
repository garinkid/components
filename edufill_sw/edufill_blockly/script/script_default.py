#!/usr/bin/env python

import roslib; roslib.load_manifest("edufill_blockly")
import rospy
import move_base_component #/edufill_navigation/edufill_base_cmds/src/move_base_component.py
import move_arm_joint_position_component  #/edufill_manipulation/edufill_arm_cmds/src/move_arm_joint_position_component.py


if __name__=="__main__":
  rospy.init_node('edufill_blockly_node')

  move_base_component.to_pose(1.1, 0, -1.5)
  move_arm_joint_position_component.pose("pregrasp_laying_mex")
