#!/usr/bin/python
import time

import roslib
roslib.load_manifest('edufill_arm_cmds')
import rospy
import actionlib


def cube():
    rospy.sleep(1)

## Main routine for running the script server
if __name__ == '__main__':
    rospy.init_node('grasp_objects')
    cube()
