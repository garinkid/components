#!/usr/bin/python
import time

import roslib
roslib.load_manifest('edufill_arm_cmds')
import rospy
#import actionlib
import move_arm_joint_position_component

#from simple_script_server import *

#sss = simple_script_server()

def main():
    rospy.init_node('move_to_zero')
    #sss.move("arm", "edufill_cube_demo")
    #move_arm_joint_position_component.joint_positions(2.94958, 0.01564, -2.59489, 2.38586, 2.9306)
    move_arm_joint_position_component.joint_positions(2.96, 2.4, -2.3, 2.9, 3.03701)
    rospy.sleep(1)

## Main routine for running the script server
if __name__ == '__main__':
    main()
