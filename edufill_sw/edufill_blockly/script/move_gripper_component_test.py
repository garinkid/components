#!/usr/bin/env python

import roslib; roslib.load_manifest("edufill_blockly")
import rospy
import move_gripper_component

# move_gripper_component example script

#### 1.move_gripper_component.to_pose(command_string) 
######### command_string-'OPEN'/'CLOSE'  

#### 2.move_gripper_component.to_positions(gripper_value) 
######### gripper_value=[left_gripper_value,right_gripper_value]

if __name__=="__main__":
  rospy.init_node('move_gripper')
  #move gripper by command- OPEN/CLOSE
  move_gripper_component.to_pose('OPEN')   # component 'to_pose()'
  move_gripper_component.to_pose('CLOSE')  # component 'to_pose()'

  #move gripper by values -[left_gripper_value,right_gripper_value]
  left_gripper_value = 0.0075 # range - 0 to 0.0115
  right_gripper_value = 0.0100
  # input argument list
  gripper_value = [left_gripper_value,right_gripper_value]
  move_gripper_component.to_joint_positions(gripper_value) # component 'to_positions()'
  move_gripper_component.to_pose('CLOSE')
