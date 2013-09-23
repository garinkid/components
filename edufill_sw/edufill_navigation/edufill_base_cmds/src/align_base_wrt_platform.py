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
import roslib; roslib.load_manifest('edufill_base_cmds')
import rospy
import brics_actuator.msg
import actionlib
import sys
import tf
import math
import std_srvs.srv
import edufill_srvs.srv
import edufill_baseplacement.msg

# msg imports
from geometry_msgs.msg import *
from move_base_msgs.msg import *

# Move arm to a cartesian position
def align_base_wrt_platform(distance):
    ac_base_adj_name = '/edufill_baseplacement/adjust_to_workspace'
    ac_base_adj = actionlib.SimpleActionClient(ac_base_adj_name, edufill_baseplacement.msg.OrientToBaseAction) 

    rospy.loginfo("Waiting for action server <<%s>> to start ...", ac_base_adj_name);
    ac_base_adj.wait_for_server()
    rospy.loginfo("action server <<%s>> is ready ...", ac_base_adj_name);
    action_goal = edufill_baseplacement.msg.OrientToBaseActionGoal()
        
    action_goal.goal.distance = distance;
    rospy.loginfo("send action");
    ac_base_adj.send_goal(action_goal.goal);
    
    rospy.loginfo("wait for base to adjust");
    finished_before_timeout = ac_base_adj.wait_for_result()

    if finished_before_timeout:
        rospy.loginfo("Action finished: %s", ac_base_adj.get_state())
        return 'succeeded'    
    else:
        rospy.logerr("Action did not finish before the time out!")
        return 'failed'    

if __name__ == '__main__':
    rospy.init_node('align_base_wrt_platform_component')
    result = align_base_wrt_platform(0.1)
    print result


