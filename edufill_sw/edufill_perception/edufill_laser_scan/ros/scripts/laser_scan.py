#!/usr/bin/env python
#******************************************************************************
# Copyright (c) 2013
# All rights reserved.
#
# Edufill project 
# Hochschule Bonn-Rhein-Sieg
# University of Applied Sciences
# Computer Science Department
#
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
# Author:
# Nirmal Giftsun, Elizaveta Shpieva, Alexey Ozhigov
# 
# Supervised by:
# Rhama Dwiputra, Bjoern Kahl
#
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
# This software is published under a dual-license: GNU Lesser General Public
# License LGPL 2.1 and BSD license. The dual-license implies that users of this
# code may choose which terms they prefer.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.
# * Neither the name of Locomotec nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License LGPL as
# published by the Free Software Foundation, either version 2.1 of the
# License, or (at your option) any later version or the BSD license.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License LGPL and the BSD license for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License LGPL and BSD license along with this program.
#
#******************************************************************************
import roslib; roslib.load_manifest('edufill_laser_scan')
import rospy
from std_msgs.msg import String
from sensor_msgs.msg import *
import math
angle_list = []
laser_data = sensor_msgs.msg.LaserScan()
def callback(data):
    # return min angles and dist
    global angle_list
    global laser_data
    laser_data = data
    resolution = (abs(data.angle_max) + abs(data.angle_min))/len(data.ranges)
    angle_temp = data.angle_min + resolution
    angle_list_minus = [data.angle_min]
    angle_list_plus = []
    # angle_list = []
    # array of angle and beams 
    for i in range((len(data.ranges)/2)-1,0, -1):
        angle = angle_temp + resolution
        angle_temp = angle
        angle_list_minus += [angle]
    angle_temp = 0
    for i in range(0,(len(data.ranges)/2)): 
        angle = angle_temp + resolution
        angle_temp = angle
        angle_list_plus += [angle]
    angle_list = angle_list_minus + angle_list_plus
    # print angle_list

    # return angle_list
def get_angle_of_closest_distance():
    global angle_list
    global laser_data
    if laser_data and angle_list:
        closest_distance = min(laser_data.ranges)
        index_closest_diatance = laser_data.ranges.index(closest_distance)
        closest_distance_angle = angle_list[index_closest_diatance]
        return closest_distance_angle

def get_distance(from_angle,to_angle):
    global angle_list
    global laser_data
    ranges_from_to = []
    # from_angle = -1.3
    # to_angle = 1.0
    if laser_data and angle_list:
        if abs(from_angle) > laser_data.angle_max and abs(from_angle) > laser_data.angle_min:
            print "From angel out of range"
        if abs(to_angle) > laser_data.angle_max and abs(to_angle) > laser_data.angle_min:
            print "To angel out of range"
        close_angle_from = min(angle_list, key=lambda x:abs(x-from_angle))
        close_angle_to = min(angle_list, key=lambda x:abs(x-to_angle))
        from_angle_distance_id = angle_list.index(close_angle_from)
        to_angle_distance_id = angle_list.index(close_angle_to)
        for i in range(from_angle_distance_id,to_angle_distance_id):
            ranges_from_to += [laser_data.ranges[i]]
        return ranges_from_to

def laser_scan_data():

    # rospy.init_node('laser_scan_data', anonymous=True)
    # # rospy.Subscriber("chatter", String, callback)
    # rospy.Subscriber("scan_front", LaserScan, callback)

    # temp = funct()
    # # get_closest_distance()
    # # print 
    # rospy.spin()
    rospy.init_node('laser_scan_data')
    # rospy.Subscriber("chatter", String, callback)
    rospy.Subscriber("scan_front", LaserScan, callback)
    while not rospy.is_shutdown():
        closest_distance = get_angle_of_closest_distance()
        angle_ranges = get_distance(-1.3,1.0)
        # print closest_distance
        # print angle_ranges
if __name__ == '__main__':
    rospy.init_node('laser_scan_data')

    laser_scan_data()
    # get_closest_distance()
    # global laser_data 
    # print laser_data
