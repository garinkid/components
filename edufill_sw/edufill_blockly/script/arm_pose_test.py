#!/usr/bin/env python

#default import
import roslib; roslib.load_manifest("edufill_blockly")
import rospy

#blockly block dependent import
import move_arm_joint_position_component  #/edufill_manipulation/edufill_arm_cmds/src/move_arm_joint_position_component.py

if __name__=="__main__":
	move_arm_joint_position_component.pose('initposition') # blockly code
	rospy.sleep(5.0)# blockly code
	move_arm_joint_position_component.pose('zeroposition') # blockly code
	rospy.sleep(5.0)# blockly code 
	move_arm_joint_position_component.pose('pregrasp_laying_mex') # blockly code
	rospy.sleep(5.0)# blockly code
	move_arm_joint_position_component.pose('pregrasp_standing_mex') # blockly code
	rospy.sleep(5.0)# blockly code 
	move_arm_joint_position_component.pose('arm_out_of_view') # blockly code
