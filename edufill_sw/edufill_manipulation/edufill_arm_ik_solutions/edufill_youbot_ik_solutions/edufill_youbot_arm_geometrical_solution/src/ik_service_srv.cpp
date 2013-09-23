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
 * Nirmal Giftsun, Elizaveta Shpieva, Alexey Ozhigov
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

#include <sensor_msgs/JointState.h>
#include <geometry_msgs/Pose.h>

#include <iostream>
#include <assert.h>
#include <cmath>

#include <boost/units/io.hpp>
#include <boost/units/systems/angle/degrees.hpp>
#include <boost/units/conversion.hpp>
#include <boost/units/systems/si/length.hpp>
#include <boost/units/systems/si/plane_angle.hpp>
#include <boost/units/io.hpp>
#include <boost/units/systems/angle/degrees.hpp>
#include <boost/units/conversion.hpp>

#include <Eigen/Geometry>
#include "/usr/include/eigen3/Eigen/src/Geometry/Quaternion.h"
#include "/usr/include/eigen3/Eigen/src/Core/Matrix.h"

#include <edufill_srvs/ComputeIK.h>
#include <edufill_youbot_arm_geometrical_solution/ik_solver.h>

using namespace std;
using namespace Eigen;

bool ComputeIK(edufill_srvs::ComputeIK::Request &req, edufill_srvs::ComputeIK::Response &res)
{
  // create eigen quaternion from quaternion message
  Eigen::Quaternion<float> target_quat = Eigen::Quaternion<float>(req.tool_pose.orientation.w,req.tool_pose.orientation.x, req.tool_pose.orientation.y, req.tool_pose.orientation.z);
  // quaternion to homogeneous transform
  Eigen::Matrix3f target_rotation = target_quat.toRotationMatrix();
  Eigen::Vector3f target_position = Eigen::Vector3f(req.tool_pose.position.x, req.tool_pose.position.y,req.tool_pose.position.z);
  
  // solution
  Eigen::VectorXf solution(5);
  
  // array containing the solutions
  std::vector<float> sol_container;
    
  for (int k=0; k<4; ++k)
  {
    // compute a specific solution
    solution = solve_ik(target_rotation, target_position, k);
    
    // if it's OK (> 0.0) memorize it into the solutions array
    if (solution(0) > 0.0)
    {
      for (int i=0; i<5; ++i)
      {
        sol_container.push_back(solution(i));
      }
    } 
  }
  
  // resize the joint_values message service to the size of the solutions container
   res.joint_values.resize(sol_container.size());
  for(unsigned int k=0; k < sol_container.size(); ++k)
  {
    res.joint_values[k] = sol_container[k];
  }
  return true;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "computeIK_server");
  ros::NodeHandle n;

  ros::ServiceServer service = n.advertiseService("edufill_arm_geometrical_solution/ComputeIK", ComputeIK);
  ROS_INFO("[SERVICE SERVER] Ready to compute IK solution for desired tool pose.");
  ros::spin();

  return 0;
}
