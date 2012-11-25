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
from geometry_msgs.msg import *
from move_base_msgs.msg import *

# Move arm to a cartesian position
def move_base_relative(x_distance, y_distance, angular_displacement):
    move_base_relative_srv_name = '/raw_relative_movements/move_base_relative'
    move_base_relative_srv = rospy.ServiceProxy(self.move_base_relative_srv_name, edufill_srvs.srv.SetPoseStamped) 
    try:            
        rospy.loginfo("wait for service: <<%s>>", move_base_relative_srv_name)   
        rospy.wait_for_service(self.move_base_relative_srv_name, 15)

        goalpose = geometry_msgs.msg.PoseStamped()
        goalpose.pose.position.x = obj_pose_transformed.pose.position.x             # WILL ONLY WORK FOR IROS FINAL
        goalpose.pose.position.y = obj_pose_transformed.pose.position.y
        goalpose.pose.position.z = 0.05 # speed
        quat = tf.transformations.quaternion_from_euler(0,0,0)

        (roll, pitch, yaw) = tf.transformations.euler_from_quaternion([obj_pose_transformed.pose.orientation.x, obj_pose_transformed.pose.orientation.y, obj_pose_transformed.pose.orientation.z, obj_pose_transformed.pose.orientation.w])   

        print "YAW of MARKER: ", yaw
        
        #goalpose.pose.orientation = obj_pose_transformed.pose.orientation
        goalpose.pose.orientation.x = quat[0]
        goalpose.pose.orientation.y = quat[1]
        goalpose.pose.orientation.z = quat[2]
        goalpose.pose.orientation.w = quat[3]
        
        print goalpose
        
        #raw_input("\npress ENTER to continue \n")
        
        self.move_base_relative_srv(goalpose)
    except Exception, e:
        rospy.logerr("service call <<%s>> failed: %s", self.move_base_relative_srv_name, e)  
        return 'srv_call_failed'

        # call base placement service
        try:

        except Exception, e:

        
        return 'succeeded'



if __name__ == '__main__':
    rospy.init_node('move_arm_joint_position_components')
    result = move_base_to_pose(0.7, 0, 0)
    print result


