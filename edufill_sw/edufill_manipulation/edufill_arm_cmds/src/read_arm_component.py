#!/usr/bin/python
import roslib; roslib.load_manifest('edufill_arm_cmds')
import rospy
import brics_actuator.msg
import actionlib
import sys
import tf
import math
import edufill_srvs.srv
import std_srvs.srv
import os
# msg imports
from geometry_msgs.msg import *
from move_base_msgs.msg import *
from nav_msgs.msg import *
from sensor_msgs.msg import *
# Move arm to a joint position

# Move arm to a given joint positions                    
def arm_joint_positions():
    joint_srv = rospy.ServiceProxy('/read_arm_joint_position', edufill_srvs.srv.ReadJointPositions) 
    # call base placement service
    try:
        #print "wait for service: read_odometry_data"   
        rospy.wait_for_service('read_arm_joint_position', 5)
        response = joint_srv()
        joint_positions = [None]*len(response.joint_positions)
        for i in range(len(response.joint_positions)):
            joint_positions[i] = response.joint_positions[i]
    except Exception, e:
        rospy.loginfo('%s',e)
        joint_positions = []
    response = joint_positions
    return response


def gripper_joint_positions():
    robot = os.getenv('ROBOT')
    if robot == 'youbot-edufill':
        joint_srv = rospy.ServiceProxy('/read_gripper_joint_position', edufill_srvs.srv.ReadJointPositions) 
        # call base placement service
        try:
            #print "wait for service: read_odometry_data"   
            rospy.wait_for_service('read_arm_joint_position', 5)
            response = joint_srv()
        except Exception, e:
            rospy.loginfo('%s',e)
        joint_positions = [None]*len(response.joint_positions)
        for i in range(len(response.joint_positions)):
            joint_positions[i] = response.joint_positions[i]
        response = joint_positions
    else:
        response=[]
        rospy.loginfo('The robot has no gripper to read positions')
    return response
  


if __name__ == '__main__':
    i =0
    while i<10:
    	joint_positions()
        i = i+1
        
