#!/usr/bin/python
import roslib; roslib.load_manifest('edufill_base_cmds')
import rospy
import brics_actuator.msg
import actionlib
import sys
import tf
import math
import std_srvs.srv
import edufill_srvs.srv
import edufill_baseplacement.msg

# msg imports
from geometry_msgs.msg import *
from move_base_msgs.msg import *

# Move arm to a cartesian position
def move_base_relative(x_distance, y_distance, angular_displacement):
    move_base_relative_srv_name = '/edufill_relative_movements/shiftbase'
    move_base_relative_srv = rospy.ServiceProxy(move_base_relative_srv_name, edufill_srvs.srv.SetPoseStamped) 
    try:            
        rospy.loginfo("wait for service: <<%s>>", move_base_relative_srv_name)   
        rospy.wait_for_service(move_base_relative_srv_name, 15)
        goalpose = geometry_msgs.msg.PoseStamped()
        goalpose.pose.position.x = x_distance             
        goalpose.pose.position.y = y_distance
        goalpose.pose.position.z = 0.05 # speed
        quat = tf.transformations.quaternion_from_euler(0,0,0)
        goalpose.pose.orientation.x = quat[0]
        goalpose.pose.orientation.y = quat[1]
        goalpose.pose.orientation.z = quat[2]
        goalpose.pose.orientation.w = quat[3]
        print goalpose        
        move_base_relative_srv(goalpose)
        return 'succeeded'
    except Exception, e:
        rospy.logerr("service call <<%s>> failed: %s", move_base_relative_srv_name, e)  
        return 'srv_call_failed'

if __name__ == '__main__':
    rospy.init_node('move_base_relative')
    result = move_base_relative(0.1, 0.2, 0)
    print result


