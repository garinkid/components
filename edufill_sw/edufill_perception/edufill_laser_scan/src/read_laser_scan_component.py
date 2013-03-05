#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_laser_scan')
from std_msgs.msg import String
from sensor_msgs.msg import *
import math
# roslib.load_manifest('edufill_subscriber')
import rospy
import std_srvs.srv
import edufill_srvs.srv
import dynamic_reconfigure.client

import numpy as np

class laser_scan_data:
    def __init__(self):
        # rospy.init_node('laser_data')

        laser_scan_srv = rospy.ServiceProxy('/read_laser_scan_data', edufill_srvs.srv.ReadLaserScan) 
        # print "wait for service: read_laser_scan_data"   
        rospy.wait_for_service('read_laser_scan_data', 30)
        # call base placement service
        self.laser_data = laser_scan_srv()
    def get_laser_scan_data(self):
        # print self.laser_data.laser_scan_data.angle_max
        return self.laser_data.laser_scan_data


def get_resolution():
    obj_laser_data = laser_scan_data()
    laser_data = obj_laser_data.get_laser_scan_data()
    resolution = (abs(laser_data.angle_max) + abs(laser_data.angle_max))/len(laser_data.ranges)
    return resolution

def get_angles():
    obj_laser_data = laser_scan_data()
    laser_data = obj_laser_data.get_laser_scan_data()
    resolution = get_resolution()
    angles_list = []
    angle_init = laser_data.angle_min + resolution
    angles_list_minus = [laser_data.angle_min]
    for i in range((len(laser_data.ranges)/2)-1,0, -1):
        angle = angle_init + resolution
        angle_init = angle
        angles_list_minus += [angle]
    angle_init = 0
    angles_list_plus = []
    for i in range(0,(len(laser_data.ranges)/2)): 
        angle = angle_init + resolution
        angle_init = angle
        angles_list_plus += [angle]
    angles_list = angles_list_minus + angles_list_plus
    return angles_list 

def ranges_and_angles():
    obj_laser_data = laser_scan_data()
    laser_data = obj_laser_data.get_laser_scan_data()
    angles_list = get_angles() 
    return zip(laser_data.ranges,angles_list)


def angle_of_closest_distance():
    obj_laser_data = laser_scan_data()
    laser_data = obj_laser_data.get_laser_scan_data()
    angles_list = get_angles() 
    closest_distance = min(laser_data.ranges)
    laser_data.ranges = np.asarray(laser_data.ranges) 
    array_closest_distance = np.where (laser_data.ranges == laser_data.ranges.min())[0]
    if len(array_closest_distance) >= 1:
        center = len(laser_data.ranges)/2
        index_closest_diatance = min(array_closest_distance, key=lambda x:abs(x-center))     
    else: 
        index_closest_diatance = array_closest_distance
    closest_distance_angle = angles_list[index_closest_diatance]
    return [closest_distance_angle,closest_distance]

def distances(angles):
    obj_laser_data = laser_scan_data()
    laser_data = obj_laser_data.get_laser_scan_data()
    resolution = get_resolution()
    angles_list = get_angles() 
    ranges_from_first_angle_to_last = []
    angles_from_first_angle_to_last = []
    if abs(angles[0]) > laser_data.angle_max and abs(angles[0]) > laser_data.angle_min:
        print "First angel out of range"
    if abs(angles[1]) > laser_data.angle_max and abs(angles[1]) > laser_data.angle_min:
        print "Last angel out of range"
    close_angle_first = min(angles_list, key=lambda x:abs(x-angles[0]))
    close_angle_last = min(angles_list, key=lambda x:abs(x-angles[1]))
    first_angle_distance_id = angles_list.index(close_angle_first)
    last_angle_distance_id = angles_list.index(close_angle_last)
    for i in range(first_angle_distance_id,last_angle_distance_id):
        ranges_from_first_angle_to_last += [laser_data.ranges[i]]
    for i in range(first_angle_distance_id,last_angle_distance_id):
        angles_from_first_angle_to_last += [angles_list[i]]
    return zip(ranges_from_first_angle_to_last,angles_from_first_angle_to_last)


# if __name__ == '__main__':
#     # range_angle = ranges_and_angles()
#     # print range_angle
#     # angle_of_closest_distance = get_angle_of_closest_distance()
#     # print angle_of_closest_distance
#     # angles_distance = get_distance(-1.3,1.0)
#     # print angles_distance