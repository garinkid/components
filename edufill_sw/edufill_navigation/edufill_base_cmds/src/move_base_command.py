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

# Move arm to a cartesian position
def move_base_command(motion_command):
    move_base_command_srv_name = '/edufill_relative_movements/update_motion_command'
    move_base_command_srv = rospy.ServiceProxy(move_base_command_srv_name,edufill_srvs.srv.MotionCommand) 
    try:            
        rospy.loginfo("wait for service: <<%s>>", move_base_command_srv_name)   
        rospy.wait_for_service(move_base_command_srv_name, 15)      
        res = move_base_command_srv(motion_command)
        return res
    except Exception, e:
        rospy.logerr("service call <<%s>> failed: %s", move_base_command_srv_name, e)  
        return 'srv_call_failed'

if __name__ == '__main__':
    rospy.init_node('move_base_command')
    motion_command = "right" 
    result = move_base_command(motion_command)
    print result


