#!/usr/bin/python
import roslib; roslib.load_manifest('edufill_base_cmds')
import rospy
import brics_actuator.msg
import actionlib
import sys
import tf
import math
import edufill_srvs.srv
import std_srvs.srv
# msg imports
from geometry_msgs.msg import *
from move_base_msgs.msg import *
from nav_msgs.msg import *
from sensor_msgs.msg import *
# Move arm to a joint position

# Move arm to a given joint positions                    
def arm_joint_positions():
    joint_srv = rospy.ServiceProxy('/read_arm_joint_position', edufill_srvs.srv.ReadJointPositions) 
    #print "wait for service: read_odometry_data"   
    rospy.wait_for_service('read_arm_joint_position', 30)
    # call base placement service
    response = joint_srv()
    response = [response[0],response[1],response[2],response[3],response[4]]
    return response

def gripper_joint_positions():
    joint_srv = rospy.ServiceProxy('/read_arm_joint_position', edufill_srvs.srv.ReadJointPositions) 
    #print "wait for service: read_odometry_data"   
    rospy.wait_for_service('read_arm_joint_position', 30)
    # call base placement service
    response = joint_srv()
    response = [response[5],response[6]]
    return response
  


if __name__ == '__main__':
    i =0
    while i<10:
    	joint_positions()
        i = i+1
        
