#!/usr/bin/python
import roslib; roslib.load_manifest('edufill_arm_cmds')
import rospy
import edufill_arm_navigation.msg
import brics_actuator.msg
import actionlib
import sys
import tf
import math

# msg imports
from edufill_arm_navigation.msg import *

# Move arm to a cartesian position
def joint_positions(x, y, z, roll, pitch, yaw, reference_frame):
    # init
    param = [x,y,z,roll,pitch,yaw,reference_frame]
    
    # convert to pose message
    pose = edufill_arm_navigation.msg.MoveToCartesianPoseGoal()
    pose.goal.header.stamp = rospy.Time.now()
    pose.goal.header.frame_id = param[6]
    pose.goal.pose.position.x = param[0]
    pose.goal.pose.position.y = param[1]
    pose.goal.pose.position.z = param[2]

    (qx, qy, qz, qw) = tf.transformations.quaternion_from_euler(param[3], param[4], param[5])
    pose.goal.pose.orientation.x = qx
    pose.goal.pose.orientation.y = qy
    pose.goal.pose.orientation.z = qz
    pose.goal.pose.orientation.w = qw

    # connecting to action server
    action_server_name = "/arm_1/arm_controller/MoveToCartesianPoseDirect"
    print "calling action server to control the arm"
    client = actionlib.SimpleActionClient(action_server_name, MoveToCartesianPoseAction)

    client.wait_for_server()
    
    # send goal
    client.send_goal(pose)

    client.wait_for_result()

    return client.get_result()

if __name__ == '__main__':
    rospy.init_node('move_arm_joint_position_components')
    result = move_arm_cart_direct(0.57, -0.04, 0, 0.2, ((math.pi/2) + (math.pi/4)), 0, "/base_link")
    print result


