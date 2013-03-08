#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_blockly')
import rospy
#import move_base_relative
import laser_scan_configure
# read_laser_scan_component example script


#### 1.result = read_laser_scan_component.laser_reconfiguration(-1.3,1.0)
######### set the first and last angles of hokuyo laser scan
if __name__=="__main__":
	rospy.init_node('laser_scan_configure')
	#Block two parameters [min_angle, max_angle] type list
	#Change laser scan first and last angles within user specified angles
	laser_scan_configure.laser_reconfiguration([-1.3,1.0])



