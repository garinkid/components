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

#include <iostream>
#include <assert.h>
#include <cmath>

#include <Eigen/Geometry>
#include <Eigen/Core>

#define DEG2RAD M_PI/180

using namespace Eigen;
using namespace std;

Eigen::VectorXd solve_ik( Eigen::Vector3d target_position, int sol_index)
{
  Eigen::VectorXd result(4);
  
  cout << "##########" << std::endl;
	cout << "Solution " << sol_index << std::endl; 
  cout << "##########" << std::endl;

  //~ index:
  //~ 0   direct space, low elbow
  //~ 1   direct space, high elbow
  //~ 2   inverse space, high elbow
  //~ 3   inverse space, low elbow
  
  // ORIGIN OF DH: base_link (ground height, axis of rotation of joint 1)
  
  Eigen::Matrix<double,3,4> DH;
  
  // -----------theta---d---------a---------alpha--
  DH.row(0) <<  0,      0.0980,   0,        1.5708;
  DH.row(1) <<  0,      0,        0.1330,   0;
  DH.row(2) <<  0,      0,        0.1170,   0;
  // ----------------------------------------------
  
  
  // from homing to DH structure
  // offset = [0, 2.073, -2.656];
  
  Eigen::VectorXd offset(3);
  offset(0) = 0;
  offset(1) = 2.077;
  offset(2) = -2.634;
  
  double d1 = DH(0,1);
  double a2 = DH(1,2);
  double a3 = DH(2,2);
  
  double q3, px, py, pxy, pz, s2, c2, c3, s3;
  double theta1, theta2, theta3;
  
  // theta1
  if (sol_index == 0 || sol_index == 1)
  {
    // direct arm space
    px = target_position(0);
    py = target_position(1);
    pz = target_position(2) - d1;
    theta1 = atan2(py, px);
    
  }
  else
  {
    // inverse arm space
    px = target_position(0);
    py = target_position(1);
    pz = target_position(2) - d1;
    theta1 = atan2(py, px) + M_PI;
  }
    
  // find cos(q3) with cosin theorem
  c3 = ( pow(px,2) + pow(py,2) + pow(pz,2) - pow(a2,2) - pow(a3,2)) / (2*a2*a3);
 
  if ( (c3 > -1) && (c3 < 1) )
  {
    pxy = sqrt(pow(px,2) + pow(py,2) );
    
    switch (sol_index)
    {
      case(0):
        // direct space, low elbow
        s3 = sqrt( 1 - pow(c3,2) );
        theta3 = atan2(s3, c3);
        
        s2 = ( (( a2+a3*c3) * pz  )  - (a3*s3*pxy ) ) / ( pow(px,2) + pow(py,2) + pow(pz,2) );
        c2 = ( (( a2+a3*c3) * pxy )  + (a3*s3*pz  ) ) / ( pow(px,2) + pow(py,2) + pow(pz,2) );
        
        theta2 = atan2(s2,c2);
        break;
      
      case(1):
        // direct space, high elbow
        s3 = - sqrt( 1 - pow(c3,2) );
        theta3 = atan2(s3, c3);
        
        s2 = ( (( a2+a3*c3) * pz  )  - (a3*s3*pxy ) ) / ( pow(px,2) + pow(py,2) + pow(pz,2) );
        c2 = ( (( a2+a3*c3) * pxy )  + (a3*s3*pz  ) ) / ( pow(px,2) + pow(py,2) + pow(pz,2) );
        
        theta2 = atan2(s2,c2);
        break;
      
      case(2):
        // inverse space, low elbow
        s3 = -sqrt( 1 - pow(c3,2) );
        theta3 = -atan2(s3, c3);
        
        s2 = ( (( a2+a3*c3) * pz  )  - (a3*s3*pxy ) ) / ( pow(px,2) + pow(py,2) + pow(pz,2) );
        c2 = ( (( a2+a3*c3) * pxy )  + (a3*s3*pz  ) ) / ( pow(px,2) + pow(py,2) + pow(pz,2) );
        
        theta2 = M_PI - atan2(s2,c2);
        break;
      
      case(3):
        // inverse space, high elbow
        s3 = sqrt( 1 - pow(c3,2) );
        theta3 = -atan2(s3, c3);
        
        s2 = ( (( a2+a3*c3) * pz  )  - (a3*s3*pxy ) ) / ( pow(px,2) + pow(py,2) + pow(pz,2) );
        c2 = ( (( a2+a3*c3) * pxy )  + (a3*s3*pz  ) ) / ( pow(px,2) + pow(py,2) + pow(pz,2) );
        
        theta2 = M_PI - atan2(s2,c2);
        break;
        
        
      default:
        ROS_ERROR("Invalid index\n");
    }  
    
    result(0) = theta1;
    result(1) = theta2;
    result(2) = theta3;
  }
  else
  {
    // position not reachable: arm will stand still ( error number: -10)
    result = result.setConstant(-10);
  }

  //Eigen::Matrix<double,3,2> range;
  //range.row(0) << -1.5708,   3.1416;
  //range.row(1) << 0,          2.4;
  //range.row(2) << 0,          5.32;
  
  
  Eigen::Matrix<double,3,2> range;
  range.row(0) << -1.5708,  3.1416;
  range.row(1) << -0.383,   2.077;
  range.row(2) << -2.668,   2.634;
  
  
  for(int k=0; k<3; ++k)
  {
    // check for solution validity: if wrong, we will return -99 as generic number to indicate that the solution is not accetable
    if( result(k) == -10)
    // if the arm can't reach the position
    {
      cout << "Solution " << sol_index << " discarded: desired goal not reachable by the robot" << std::endl;
      result = result.setConstant(-99);
      k = 3;
    }
    else if( range(k,0) > result(k) || range(k,1) < result(k) )
    // if the solution has joint values that will make the robot self collide
    {
      cout << "Solution " << sol_index << " discarded: joint " << k+1 << " outside accetable ranges. Value: " << result(k) << "; Range: [" << range(k,0) << " , " << range(k,1) << "]" << std::endl;
      result = result.setConstant(-99);
      k = 3;
    }
    else
    {
      // everything is fine
    }
  }
  
  result(1) = theta2 - offset(1);
  result(2) = theta3 - offset(2);
  result(3) = (double)sol_index;
	return result;  
}
