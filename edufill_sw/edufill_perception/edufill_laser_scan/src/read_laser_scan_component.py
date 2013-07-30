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
# import tf
import numpy as np
from random import choice

class laser_scan_data:
    def __init__(self):
        laser_scan_srv = rospy.ServiceProxy('/read_laser_scan_data', edufill_srvs.srv.ReadLaserScan) 
        rospy.wait_for_service('read_laser_scan_data', 30)
        # call base placement service
        self.laser_data = laser_scan_srv()
    def get_laser_scan_data(self):
        return self.laser_data.laser_scan_data
    

def get_resolution():
    obj_laser_data = laser_scan_data()
    laser_data = obj_laser_data.get_laser_scan_data()
    resolution = (abs(laser_data.angle_max) + abs(laser_data.angle_min))/len(laser_data.ranges)
    return resolution

def get_angles_distances():
    filtered_angles_list = []
    filtered_ranges = []
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
    for i in range(0,len(laser_data.ranges)):
        if laser_data.ranges[i] < 0.008:
            filtered_angles_list.append(angles_list[i])
            filtered_ranges.append(5.0)	    
	else:
            filtered_angles_list.append(angles_list[i])
            filtered_ranges.append(laser_data.ranges[i])
    return [filtered_angles_list,filtered_ranges] 

def ranges_and_angles():
    angles_distances = get_angles_distances()
    return zip(angles_distances[0],angles_distances[1])



def angle_of_closest_distance():
    obj_laser_data = laser_scan_data()
    laser_data = obj_laser_data.get_laser_scan_data()
    angles_list_distances = get_angles_distances()
    angles_list = angles_list_distances[0]
    closest_distance = min(laser_data.ranges)
    laser_data.ranges = np.asarray(laser_data.ranges) 
    array_closest_distance = np.where (laser_data.ranges == laser_data.ranges.min())[0]
    if len(array_closest_distance) >= 1:
        center = len(laser_data.ranges)/2
        index_closest_diatance = min(array_closest_distance, key=lambda x:abs(x-center))     
    else: 
        index_closest_diatance = array_closest_distance
    closest_distance_angle = angles_list[index_closest_diatance]
    return [closest_distance, closest_distance_angle]

def distances(angles):
    obj_laser_data = laser_scan_data()
    laser_data = obj_laser_data.get_laser_scan_data()
    resolution = get_resolution()
    angles_list_distances = get_angles_distances()
    angles_list = angles_list_distances[0]
    distances_list = angles_list_distances[1]
    ranges_from_first_angle_to_last = []
    angles_from_first_angle_to_last = []
    if abs(angles[0]) > laser_data.angle_max and abs(angles[0]) > laser_data.angle_min:
        rospy.logerr("First angel out of range")
    if abs(angles[1]) > laser_data.angle_max and abs(angles[1]) > laser_data.angle_min:
        rospy.logerr("Last angel out of range")
    close_angle_first = min(angles_list, key=lambda x:abs(x-angles[0]))
    close_angle_last = min(angles_list, key=lambda x:abs(x-angles[1]))
    first_angle_distance_id = angles_list.index(close_angle_first)
    last_angle_distance_id = angles_list.index(close_angle_last)
    if first_angle_distance_id > last_angle_distance_id:
        temp = last_angle_distance_id
        last_angle_distance_id = first_angle_distance_id
        first_angle_distance_id = temp 
    for i in range(first_angle_distance_id,last_angle_distance_id):
        ranges_from_first_angle_to_last += [distances_list[i]]
    for i in range(first_angle_distance_id,last_angle_distance_id):
        angles_from_first_angle_to_last += [angles_list[i]]
    return zip(angles_from_first_angle_to_last,ranges_from_first_angle_to_last)

def get_x_y(angles_distances):
    y = []
    x = []
    t = 0 
    for (angles,distances) in zip(angles_distances[0], angles_distances[1]):
        x.append(distances * math.sin(angles))
        if angles == 0:
            y.append(distances)
        else:
            y.append((x[-1] * math.cos(angles))/math.sin(angles))
        t = t + 1
    return [x,y]

def wall_existance(side_coordinates):
    avg = reduce(lambda x, y: x + y, side_coordinates) / len(side_coordinates)
    count_t = 0
    count_f = 0 
    for i in side_coordinates:
        if (avg  - i) < 0.04:
            count_t = count_t + 1
        else:
            count_f = count_f + 1
    if count_t > count_f:
        return True
    else:
        return "Not a wall"

def check_wall(side,distance=0.6):
    angle_max = 1.56
    if side == "left":
        angles_and_distances_to_wall = zip(*distances([angle_max,angle_max-0.15]))
        x_y = get_x_y(angles_and_distances_to_wall)
        exist = wall_existance(x_y[0])
        if exist == True:
            resp = get_wall(angle_max,distance)
            return resp
    elif side == "right":
        angles_and_distances_to_wall = zip(*distances([-angle_max,-angle_max+0.15]))
        x_y = get_x_y(angles_and_distances_to_wall)
        exist = wall_existance(x_y[0])
        if exist == True:
            resp = get_wall(-angle_max,distance)
            return resp
    elif side == "front":
        angles_and_distances_to_wall = zip(*distances([0.2,-0.2]))
	x_y = get_x_y(angles_and_distances_to_wall)
        exist = wall_existance(x_y[1])
        if exist == True:
            resp = get_wall(0.0,distance)
            return resp
    else:
        rospy.logerr("Input data is not correct") 
        return False   
   
    # return distance_to_wall


def get_wall(angle,distance):
    angles_list_distances = get_angles_distances()
    angles_list = angles_list_distances[0]
    close_angle = min(angles_list, key=lambda x:abs(x-angle))
    for a,d in ranges_and_angles():
        if close_angle == a and distance > d:
            return True
        elif close_angle == a and distance < d:
            return False

# if __name__ == '__main__':
    # range_angle = ranges_and_angles()
    # print range_angle
    # wall = check_wall("left",0.5)
    # print wall
    # wall = is_wall(1.3,1)
    # print wall
    # angle_of_closest_distance = get_angle_of_closest_distance()
    # print angle_of_closest_distance
    # angles_distance = get_distance(-1.3,1.0)
    # print angles_distance


