#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_blockly')
import rospy
import read_arm_component

# read_base_component example script

#### 1.msg = read_arm_component.arm_joint_positions() 
######### msg is a vector of joint positions = [j1,j2,j3,j4,j5]

#### 2.msg = read_arm_component.gripper_joint_positions() 
######### msg is a vector of gripper positions = [gripper_l,gripper_r]


if __name__=="__main__":
    rospy.init_node('read_base_component_test',disable_signals=False)
    # read the current joint angle of arm
    result = read_arm_component.arm_joint_positions() 
    print result
    # read the current gripper positions 
    result = read_arm_component.gripper_joint_positions()
    print result



