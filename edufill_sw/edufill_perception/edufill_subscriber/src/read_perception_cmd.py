#!/usr/bin/python
import roslib; roslib.load_manifest('edufill_subscriber')
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
from nav_msgs.msg import *
from sensor_msgs.msg import *

class youbot_subscriber:
    def __init__(self):
        # setting up variables for message subscription 
	self.joint_names = ["arm_joint_1", "arm_joint_2", "arm_joint_3", "arm_joint_4", "arm_joint_5","gripper_finger_joint_l","gripper_finger_joint_r"]
	self.configuration = [0, 0, 0, 0, 0, 0, 0]
	self.received_state = False
        self.odom_data = nav_msgs.msg.Odometry()
        self.arm_joint_positions = nav_msgs.msg.Odometry()

        # services for advertising perception messages
        self.read_odom_server = rospy.Service('read_odometry_data', edufill_srvs.srv.ReadOdom, self.read_odometry_data)
        self.read_arm_joint_position_server = rospy.Service('read_arm_joint_position', edufill_srvs.srv.ReadJointPositions,                  self.read_arm_joint_positions)

        # subscribers
        self.jointstate_sub = rospy.Subscriber('/joint_states', sensor_msgs.msg.JointState, self.joint_states_callback)
        self.odometry_sub = rospy.Subscriber('/odom', nav_msgs.msg.Odometry, self.odom_callback)

    def joint_states_callback(self,msg):
        for k in range(7):
            for i in range(len(msg.name)):
	        joint_name = self.joint_names[k]
		if(msg.name[i] == joint_name):
		    self.configuration[k] = msg.position[i]
		    self.received_state = True
    def odom_callback(self,msg):
        self.odom_data = msg

    def read_arm_joint_positions(self,req):
        print 'yes'
        return edufill_srvs.srv.ReadJointPositionsResponse(self.configuration)

    def read_odometry_data(self,req):
        return edufill_srvs.srv.ReadOdomResponse(self.odom_data)
    
      


if __name__ == '__main__':
    rospy.init_node('read_perception_cmd')
    print 's'
    s = youbot_subscriber()
    rospy.spin() 


