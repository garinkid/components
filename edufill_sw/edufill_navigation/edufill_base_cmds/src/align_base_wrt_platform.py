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
def align_base_wrt_platform(distance):
    ac_base_adj_name = '/edufill_baseplacement/adjust_to_workspace'
    ac_base_adj = actionlib.SimpleActionClient(ac_base_adj_name, edufill_baseplacement.msg.OrientToBaseAction) 

    rospy.loginfo("Waiting for action server <<%s>> to start ...", ac_base_adj_name);
    ac_base_adj.wait_for_server()
    rospy.loginfo("action server <<%s>> is ready ...", ac_base_adj_name);
    action_goal = edufill_baseplacement.msg.OrientToBaseActionGoal()
        
    action_goal.goal.distance = distance;
    rospy.loginfo("send action");
    ac_base_adj.send_goal(action_goal.goal);
    
    rospy.loginfo("wait for base to adjust");
    finished_before_timeout = ac_base_adj.wait_for_result()

    if finished_before_timeout:
        rospy.loginfo("Action finished: %s", ac_base_adj.get_state())
        return 'succeeded'    
    else:
        rospy.logerr("Action did not finish before the time out!")
        return 'failed'    

if __name__ == '__main__':
    rospy.init_node('align_base_wrt_platform_component')
    result = align_base_wrt_platform(0.1)
    print result


