#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_blockly')
import rospy
#import move_base_relative
import read_laser_scan_component
# read_laser_scan_component example script

#### 1.result = read_laser_scan_component.ranges_and_angles() 
######### result is a list of lists [(ranges,angles)]

#### 2.result = read_laser_scan_component.angle_of_closest_distance()
######### result is a list [closest_distance, closest_distance_angle]

#### 3.result = read_laser_scan_component.distances(-1.3,1.0)
######### result is a list of lists [(ranges,angles)]
if __name__=="__main__":
	rospy.init_node('laser_data')
	#Block without parameters
	#Read laser scan ranges and angles
	result = read_laser_scan_component.ranges_and_angles()
	print result
	#Block without parameters
	#Read laser scan closest distance to obstical with angle
	result = read_laser_scan_component.angle_of_closest_distance()
	print result
	#Block two parameters [min_angle, max_angle] type list
	#Read laser scan ranges and angles within user specified angles
	result = read_laser_scan_component.distances(-1.3,1.0)
	print result 



