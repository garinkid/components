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
from nav_msgs.msg import *


def odometry():
    odom_srv = rospy.ServiceProxy('/read_odometry_data', edufill_srvs.srv.ReadOdom) 
    print "wait for service: read_odometry_data"   
    rospy.wait_for_service('read_odometry_data', 30)
    # call base placement service
    response = odom_srv()
    return response
    

def location():
    tf_listener = tf.TransformListener()
    transforms_received = False
    while(not transforms_received):
        try:
            tf_listener.waitForTransform('map', '/base_link', rospy.Time.now(), rospy.Duration(1))
            (trans, rot) = tf_listener.lookupTransform('/map', '/base_link', rospy.Time(0))
            location = PoseStamped()
            location.pose.position.x = trans[0]
            location.pose.position.y = trans[1]
            location.pose.position.z = trans[2]
            location.pose.orientation.x = rot[0] 
            location.pose.orientation.y = rot[1] 
            location.pose.orientation.z = rot[2] 
            location.pose.orientation.w = rot[3] 
            transforms_received = False
	    return location
        except Exception, e:
            rospy.sleep(1)
            print 'trying to get tf'
            transforms_received = False

if __name__ == '__main__':
    rospy.init_node('readbase',disable_signals=False)
    #Odometry = odometry()
    #print Odometry





    



