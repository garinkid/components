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
def to_pose(pose):
    x = pose[0]
    y = pose[1]
    yaw = pose[2] 
    
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

def to_goal(goal):

    if (not rospy.has_param("script_server/base/" + goal)):
        rospy.logerr("location <<" + goal + ">> is not on the parameter server")
        return 'location_not_known'
    
    pose = rospy.get_param("script_server/base/" + goal)
   
    result = to_pose(pose[0],pose[1],pose[2])  
  
    return result    


if __name__ == '__main__':
    rospy.init_node('move_base_to_goal_component')
    x_pose = 0
    y_pose = 0
    theta  = 0
    pose = [x_pose,y_pose,theta]
    result = to_pose(pose)
    print result



