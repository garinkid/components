/******************************************************************************
 * Copyright (c) 2013
 * All rights reserved.
 *
 * Edufill project 
 * Hochschule Bonn-Rhein-Sieg
 * University of Applied Sciences
 * Computer Science Department
 *
 * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *
 * Author:
 * Nirmal Giftsun, Elizaveta Shpieva, Alexey Ozhigov, Moreno Koo
 * 
 * Supervised by:
 * Rhama Dwiputra, Bjoern Kahl
 *
 * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *
 * This software is published under a dual-license: GNU Lesser General Public
 * License LGPL 2.1 and BSD license. The dual-license implies that users of this
 * code may choose which terms they prefer.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 * * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * * Neither the name of Locomotec nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License LGPL as
 * published by the Free Software Foundation, either version 2.1 of the
 * License, or (at your option) any later version or the BSD license.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License LGPL and the BSD license for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License LGPL and BSD license along with this program.
 *
 ******************************************************************************/
#include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>
#include <cmath>

class youbot_joy_teleop
{
  public:
    youbot_joy_teleop();

  private:
    void joyCallback(const sensor_msgs::Joy::ConstPtr& joy);
    void odomCallback(const nav_msgs::Odometry::ConstPtr& odom);
  
    float l_scale_;
    
    float vx, vy, omega;
    float d_vx, d_vy, d_omega;

    float cmd_x, cmd_y, cmd_omega;  
    geometry_msgs::Twist twist;   
      
    ros::NodeHandle nh_;
  
    ros::Publisher youbot_twist;
    ros::Subscriber joy_data;
    ros::Subscriber youbot_odom;
};


youbot_joy_teleop::youbot_joy_teleop()
{
  twist.linear.x = 0.0;
  twist.linear.y = 0.0;
  twist.linear.z = 0.0;
  
  twist.angular.x = 0.0;
  twist.angular.y = 0.0;
  twist.angular.z = 0.0;

  l_scale_ = 0.2;
  
  cmd_x = 0.0;
  cmd_y = 0.0;
  cmd_omega = 0.0;
  
  vx = 0.0;
  vy = 0.0;
  omega = 0.0;
 
  youbot_twist = nh_.advertise<geometry_msgs::Twist>("cmd_vel", 10);
  
  youbot_odom = nh_.subscribe<nav_msgs::Odometry>("odom",10, &youbot_joy_teleop::odomCallback, this);
  joy_data = nh_.subscribe<sensor_msgs::Joy>("joy", 10, &youbot_joy_teleop::joyCallback, this);

}

void youbot_joy_teleop::odomCallback(const nav_msgs::Odometry::ConstPtr& odom)
{
  vx = odom->twist.twist.linear.x;
  vy = odom->twist.twist.linear.y;
  omega = odom->twist.twist.angular.z;
}

void youbot_joy_teleop::joyCallback(const sensor_msgs::Joy::ConstPtr& joy)
{
  cmd_y = l_scale_ * joy->axes[0];
  cmd_x = l_scale_ * joy->axes[1];
  cmd_omega = 3* l_scale_ * joy->axes[3];

  twist.linear.x = cmd_x;
  twist.linear.y = cmd_y;
  twist.angular.z = cmd_omega;
  youbot_twist.publish(twist); 

}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "youbot_joypad_teleop");
  youbot_joy_teleop yjt;

  ros::spin();

}
