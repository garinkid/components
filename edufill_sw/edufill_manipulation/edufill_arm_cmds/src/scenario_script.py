#!/usr/bin/python
import roslib; roslib.load_manifest('edufill_arm_cmds')
import rospy
import edufill_arm_navigation.msg
import brics_actuator.msg
import actionlib
import sys
import tf
import math
import move_base_to_pose

# msg imports
from geometry_msgs.msg import *
from move_base_msgs.msg import *

# Move arm to a cartesian position
def move_base_to_goal(goal):

    if (not rospy.has_param("script_server/base/" + goal)):
        rospy.logerr("location <<" + goal + ">> is not on the parameter server")
        return 'location_not_known'
    
    pose = rospy.get_param("script_server/base/" + goal)
   
    result = move_base_to_pose.move_base_to_pose(pose[0],pose[1],pose[2])  
  
    return result    


if __name__ == '__main__':
    rospy.init_node('scenario_script')
    result = move_base_to_goal('S1')
    if result == 'succeeded':
        result = move_arm_cart_direct(0.4, 0.1, 0.15, 0, ((math.pi/2) + (math.pi/4)), 0, "/base_link")
    if result == 'succeeded':
        result = move_arm_cart_direct(0.4, 0.1, 0.15, 0, ((math.pi/2) + (math.pi/4)), 0, "/base_link")
    if result ==  'succeeded'    
        result = move_base_to_goal('S2')    
    print result


