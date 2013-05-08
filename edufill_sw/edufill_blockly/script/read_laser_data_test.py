#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_blockly')
import rospy
#import move_base_relative
import read_laser_scan_component
# read_laser_scan_component example script

#### 1.result = read_laser_scan_component.ranges_and_angles() 
######### result is a list of lists [(ranges,angles)]

#### 2.result = read_laser_scan_component.angle_of_closest_distance()
######### result is a list [closest_distance_angle,closest_distance]

#### 3.result = read_laser_scan_component.distances(-1.3,1.0)
######### result is a list of lists [(ranges,angles)]
if __name__=="__main__":
	rospy.init_node('read_laser_scan')
	#Block without parameters
	#Read laser scan ranges and angles
	result = read_laser_scan_component.ranges_and_angles()
	print "1"
	print result
	#Block without parameters
	#Read laser scan closest distance to obstical with angle
	result = read_laser_scan_component.angle_of_closest_distance()
	print "2"
	print result
	#Block one parameter [min_angle, max_angle] type list
	#Read laser scan ranges and angles within user specified angles
	result = read_laser_scan_component.distances([-1.3,1.0])
	print "3"
	print result
	#Block one parameters side type string 
	#Return value True is wall in 0.4 meters from robot else False 
	result = read_laser_scan_component.check_wall("left")
	print "4"
	print result
	#Block two parameters side, distance type string ,float
	#Return value True is wall in distance meters from robot else False 
	result = read_laser_scan_component.check_wall("left", 1.4)
	print "5"
	print result
	#Block two parameters float,distance type string ,float
	#Return value True is wall on certant angle and disctance from robot else False 
	result = read_laser_scan_component.is_wall(0.0, 0.4)
	print "6"
	print result





