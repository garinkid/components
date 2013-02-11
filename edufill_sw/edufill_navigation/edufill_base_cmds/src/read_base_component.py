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

last_message = 0
odom_received = 'false'



#def odom_listener():

    #if odom_received == 'false':
    
    
    
def odom_callback(msg):
    global last_message
    global odom_received
    last_message = msg
    odom_received = 'true'
    #print last_message
def odometry():
    global last_message
    global odom_received
    sub = rospy.Subscriber("/odom", Odometry, odom_callback)
    rospy.spin()
    if odom_received == 'true': 
       rospy.signal_shutdown('I got it')
       return last_message  
    else:    
       print 'trying'
    


def location():
    tf_listener = tf.TransformListener()
    tf_received = False
    if(not tf_received):
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
		    return location
            except Exception, e:
                    rospy.sleep(1)
                    tf_received = False
            tf_received = False


if __name__ == '__main__':
    rospy.init_node('readbase')
    location = location()
    print location



    



