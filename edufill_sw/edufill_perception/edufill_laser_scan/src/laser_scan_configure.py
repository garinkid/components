#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_laser_scan')
from std_msgs.msg import String
from sensor_msgs.msg import *
import math
import sys
import rospy
import std_srvs.srv
import edufill_srvs.srv
import dynamic_reconfigure.client

def laser_reconfiguration(angles):
	client = dynamic_reconfigure.client.Client('hokuyo_node')
	if angles[0] <= -math.pi:
	    print "First angle out of range"
	if angles[1] >= math.pi:
	    print "Last angle out of range"
	new_config = { 'min_ang' : angles[0], 'max_ang' : angles[1] }
	rospy.loginfo('Setting laser to the navigation configuration: %s' % new_config)
	config = client.update_configuration(new_config)

# if __name__ == '__main__':
# 	laser_reconfiguration([-1.4,0.7])
