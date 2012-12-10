#!/usr/bin/python
import time

import roslib
roslib.load_manifest('edufill_arm_cmds')
import rospy
import actionlib

import move_gripper_component  #/edufill_manipulation/edufill_arm_cmds/src/move_gripper_component.py

import move_arm_joint_position_component  #/edufill_manipulation/edufill_arm_cmds/src/move_arm_joint_position_component.py


def grasp_cube():

    move_gripper_component.move("OPEN")
    
    move_arm_joint_position_component.joint_positions(0, 0, 0, 0, 0)
    
    rospy.sleep(1)
   
    move_gripper_component.move("CLOSE")

    move_arm_joint_position_component.pose("initposition")

    rospy.sleep(1)

## Main routine for running the script server
if __name__ == '__main__':
    rospy.init_node('grasp_cube')
    main()
