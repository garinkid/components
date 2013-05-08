#!/usr/bin/env python

import roslib; roslib.load_manifest("edufill_blockly")
import rospy
import move_base_component #edufill_navigation/edufill_base_cmds/src/move_base_component.py


if __name__=="__main__":
  rospy.init_node('edufill_blockly_node')

  move_base_component.command("backward", 20)
