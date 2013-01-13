#!/usr/bin/python
import roslib; roslib.load_manifest('edufill_arm_cmds')
import rospy
import brics_actuator.msg
import actionlib
import sys
import tf
import math

# msg imports
from geometry_msgs.msg import *
from move_base_msgs.msg import *

# Move arm to a cartesian position
def move_base_to_pose(x, y, yaw):
    
    try: 

        # convert to pose message
        pose = PoseStamped()
        pose.header.stamp = rospy.Time.now()
        pose.header.frame_id = "/map"
        pose.pose.position.x = x
        pose.pose.position.y = y
        pose.pose.position.z = 0.0
        q = tf.transformations.quaternion_from_euler(0, 0, yaw)
        pose.pose.orientation.x = q[0]
        pose.pose.orientation.y = q[1]
        pose.pose.orientation.z = q[2]
        pose.pose.orientation.w = q[3]

        action_server_name = "/move_base"
        client = actionlib.SimpleActionClient(action_server_name, MoveBaseAction)
        client_goal = MoveBaseGoal()
        client_goal.target_pose = pose 
        client.wait_for_server()
        # send goal
        client.send_goal(client_goal)
        client.wait_for_result()
        return 'succeeded'

    except Exception, e:
        rospy.logerr("service call <<%s>> failed: %s", self.move_base_relative_srv_name, e)  
        return 'srv_call_failed'

if __name__ == '__main__':
    rospy.init_node('move_base_to_pose')
    result = move_base_to_pose(0, 0, 0)
    print result


