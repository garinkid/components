#!/usr/bin/env python

#default import
import roslib; roslib.load_manifest("edufill_blockly")
import rospy

#blockly block dependent import
import move_arm_joint_position_component  #/edufill_manipulation/edufill_arm_cmds/src/move_arm_joint_position_component.py

if __name__=="__main__":
	move_arm_joint_position_component.joint_positions(0.011, 0.011, -0.1, 0.023, 0.12) # blockly code
	rospy.sleep(5.0)# blockly code
	move_arm_joint_position_component.joint_positions(3.02221, 2.48996, -1.53309, 1.17502, 2.92980) # blockly code
	rospy.sleep(5.0)# blockly code
	move_arm_joint_position_component.joint_positions(2.94958, 0.01564, -2.59489, 2.38586, 2.93068) # blockly code
