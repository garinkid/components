#!/usr/bin/env python

import rospy
import roslib; roslib.load_manifest('edufill_ultrasonic_range') 
import math
import thread
import edufill_srvs.srv
from nxt_msgs.msg import Range

def distance():
	ultrasonic_srv = rospy.ServiceProxy('/read_ultrasonic_sensor', edufill_srvs.srv.ReadUltrasonic) 
	rospy.wait_for_service('read_ultrasonic_sensor', 30)
	response = ultrasonic_srv()
	return response.ultrasonic_data.range
