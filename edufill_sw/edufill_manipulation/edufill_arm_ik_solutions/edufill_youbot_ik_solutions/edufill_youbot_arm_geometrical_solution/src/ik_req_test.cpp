#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <geometry_msgs/Pose.h>
#include <tf/transform_datatypes.h>

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

#include "brics_actuator/JointPositions.h"
#include "brics_actuator/CartesianWrench.h"

#include <edufill_srvs/ComputeIK.h>

using namespace std;

int main(int argc, char **argv)
{
	// Init
	float roll,pitch,yaw,pose_x,pose_y,pose_z;
	ros::Time call_t;
	ros::Time compute_t;
	ros::Duration busy_t;
  ros::init(argc, argv, "computeIK_test_client");

	// Service
  ros::NodeHandle nh_;
  ros::ServiceClient client = nh_.serviceClient<edufill_srvs::ComputeIK>("edufill_arm_geometrical_solution/ComputeIK");
  edufill_srvs::ComputeIK srv;
  
  // Message
	brics_actuator::JointPositions command;
  vector<brics_actuator::JointValue> armJointPositions;
	ros::Publisher armPositionsPublisher;
  armJointPositions.resize(5);
  armPositionsPublisher = nh_.advertise<brics_actuator::JointPositions > ("arm_1/arm_controller/position_command", 10);
  
  
  if (argc > 1)
  {
		std::string args(argv[1]);
		if (args == "home")
		{
      while (armPositionsPublisher.getNumSubscribers() == 0)
      {
				printf("Waiting for subscribers...\n");
				ros::Duration(0.1).sleep();
      }
      armJointPositions[0].joint_uri = "arm_joint_1";
      armJointPositions[0].value = 0.0101;
      armJointPositions[0].unit = boost::units::to_string(boost::units::si::radians);
      armJointPositions[1].joint_uri = "arm_joint_2";
      armJointPositions[1].value = 0.0101;
      armJointPositions[1].unit = boost::units::to_string(boost::units::si::radians);
      armJointPositions[2].joint_uri = "arm_joint_3";
      armJointPositions[2].value = -0.0158;
      armJointPositions[2].unit = boost::units::to_string(boost::units::si::radians);
      armJointPositions[3].joint_uri = "arm_joint_4";
      armJointPositions[3].value = 0.0222;
      armJointPositions[3].unit = boost::units::to_string(boost::units::si::radians);
      armJointPositions[4].joint_uri = "arm_joint_5";
      armJointPositions[4].value = 0.111;
      armJointPositions[4].unit = boost::units::to_string(boost::units::si::radians);
      command.positions = armJointPositions;
      printf("Publishing command [%f %f %f %f %f]\n", armJointPositions[0].value, armJointPositions[1].value, armJointPositions[2].value, armJointPositions[3].value, armJointPositions[4].value); 
      for(int i=0; i<20; ++i)
      {
        armPositionsPublisher.publish(command);
      }
      return 0;
		}
    else if (args == "up")
    {
      while (armPositionsPublisher.getNumSubscribers() == 0)
      {
				printf("Waiting for subscribers...\n");
				ros::Duration(0.1).sleep();
      }
      armJointPositions[0].joint_uri = "arm_joint_1";
      armJointPositions[0].value = 2.94961;
      armJointPositions[0].unit = boost::units::to_string(boost::units::si::radians);
      armJointPositions[1].joint_uri = "arm_joint_2";
      armJointPositions[1].value = 1.1345;
      armJointPositions[1].unit = boost::units::to_string(boost::units::si::radians);
      armJointPositions[2].joint_uri = "arm_joint_3";
      armJointPositions[2].value = -2.5842;
      armJointPositions[2].unit = boost::units::to_string(boost::units::si::radians);
      armJointPositions[3].joint_uri = "arm_joint_4";
      armJointPositions[3].value = 1.7802;
      armJointPositions[3].unit = boost::units::to_string(boost::units::si::radians);
      armJointPositions[4].joint_uri = "arm_joint_5";
      armJointPositions[4].value = 2.9417;
      armJointPositions[4].unit = boost::units::to_string(boost::units::si::radians);
      command.positions = armJointPositions;
      printf("Publishing command [%f %f %f %f %f]\n", armJointPositions[0].value, armJointPositions[1].value, armJointPositions[2].value, armJointPositions[3].value, armJointPositions[4].value); 
      for(int i=0; i<20; ++i)
      {
        armPositionsPublisher.publish(command);
      }
      return 0;
    }
    else
    {
      ROS_ERROR("Argument Error");
      return -1;
    }
	}
	else
	{
		printf("Please input desired tool goal rotation and position. [RZ RY RX TX TY TZ]\n");
	
		cin >> yaw >> pitch >> roll >> pose_x >> pose_y >> pose_z;
	
		geometry_msgs::Quaternion target_quat = tf::createQuaternionMsgFromRollPitchYaw(roll,pitch,yaw);
		srv.request.tool_pose.position.x = pose_x;
		srv.request.tool_pose.position.y = pose_y;
		srv.request.tool_pose.position.z = pose_z;
		srv.request.tool_pose.orientation.x = target_quat.x;
		srv.request.tool_pose.orientation.y = target_quat.y;
		srv.request.tool_pose.orientation.z = target_quat.z;
		srv.request.tool_pose.orientation.w = target_quat.w;
	
	  cout << "Desired rotation\n----------------" << std::endl << "ZYX: [" << yaw << " " << pitch << " " << roll << "]" << std::endl; 
	  cout << "QUAT wzyx: [" << target_quat.w << " " << target_quat.x << " " << target_quat.y << " " << target_quat.z << "]\n";
	  cout << "Position XYZ: [" << pose_x << " " << " " << pose_y << " " << pose_z << "]\n\n";
	  call_t = ros::Time::now();
	 
		if (client.call(srv))
	  {   
			compute_t = ros::Time::now(); 
			busy_t = compute_t - call_t;
			         
			cout << "Time required for computation\n-----------------------------" << std::endl << busy_t.toSec()*1000 << " ms.\n\n";
	    int nvals = srv.response.joint_values.size();
	    int nsols = nvals/5;
	    
	    Eigen::MatrixXf response(nsols,5);
	    
	    int k = 0;
	    while(k<nvals)
	    {
	      for (int i=0; i<nsols; ++i)
	      {
	        for (int j=0; j<5; ++j)
	        { 
	          response(i,j) = srv.response.joint_values[k];
	          ++k;
	        }
	      } 
	    }
	    cout << "Solutions found: " << nsols << std::endl << response << std::endl;
	
	
			if (nsols > 0)
			{
				int input_row;
				printf("Choose solution row (start with 0). Currently subscribed nodes: %d\n", armPositionsPublisher.getNumSubscribers());
				cin >> input_row;
							
				while (armPositionsPublisher.getNumSubscribers() == 0)
				{
					printf("Waiting for subscribers...\n");
					ros::Duration(0.1).sleep();
				}
		
				armJointPositions[0].joint_uri = "arm_joint_1";
				armJointPositions[0].value = response(input_row,0);
				armJointPositions[0].unit = boost::units::to_string(boost::units::si::radians);
		
				armJointPositions[1].joint_uri = "arm_joint_2";
				armJointPositions[1].value = response(input_row,1);
				armJointPositions[1].unit = boost::units::to_string(boost::units::si::radians);
		
				armJointPositions[2].joint_uri = "arm_joint_3";
				armJointPositions[2].value = response(input_row,2);
				armJointPositions[2].unit = boost::units::to_string(boost::units::si::radians);
		
				armJointPositions[3].joint_uri = "arm_joint_4";
				armJointPositions[3].value = response(input_row,3);
				armJointPositions[3].unit = boost::units::to_string(boost::units::si::radians);
		
				armJointPositions[4].joint_uri = "arm_joint_5";
				armJointPositions[4].value = response(input_row,4);
				armJointPositions[4].unit = boost::units::to_string(boost::units::si::radians);
				
				command.positions = armJointPositions;
				
				printf("Publishing command [%f %f %f %f %f]\n", armJointPositions[0].value, armJointPositions[1].value, armJointPositions[2].value, armJointPositions[3].value, armJointPositions[4].value); 
				
				for(int i=0; i<20; ++i)
				{
					armPositionsPublisher.publish(command);
				}
			}
			
	  }
	  else
	  {
	    ROS_ERROR("Failed to call service edufill_arm_geometrical_solution/ComputeIK");
	    return -1;
	  }
	
	  return 0;
	}
}
