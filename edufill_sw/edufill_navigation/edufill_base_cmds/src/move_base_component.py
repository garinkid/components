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

def relative(goal_behaviour):
    x_distance = goal_behaviour[0]
    y_distance = goal_behaviour[1]
    angular_displacement = goal_behaviour[2]
    move_base_relative_srv_name = '/edufill_relative_movements/move_base_relative'
    move_base_relative_srv = rospy.ServiceProxy(move_base_relative_srv_name,edufill_srvs.srv.SetPoseStamped) 
    try:            
        rospy.loginfo("wait for service: <<%s>>", move_base_relative_srv_name)   
        rospy.wait_for_service(move_base_relative_srv_name, 15)
        goalpose = geometry_msgs.msg.PoseStamped()
        goalpose.pose.position.x = x_distance             
        goalpose.pose.position.y = y_distance
        goalpose.pose.position.z = 0.05 # speed
        quat = tf.transformations.quaternion_from_euler(0,0,angular_displacement)
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
    rospy.init_node('move_base_to_goal_component')
    x_pose = 0
    y_pose = 0
    theta  = 0
    pose = [x_pose,y_pose,theta]
    result = to_pose(pose)
    print result



