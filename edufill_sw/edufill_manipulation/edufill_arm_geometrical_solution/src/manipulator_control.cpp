#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <geometry_msgs/Pose.h>
#include <tf/transform_datatypes.h>

#include <iostream>
#include <assert.h>
#include <cmath>
#include <list>


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
#include <edufill_srvs/CartesianPose.h>

using namespace std;


class manupulator_control
{
public:
	manupulator_control();
	void move_arm_to_cartesian_pose();
	bool check_ik_solver_has_solution();
	Eigen::MatrixXf get_ik_solution();

	vector<float> cartesianPosition;
	double sumresponse;
	float sumofCurrentJoints;
	int nsols;
	int nvals;
	edufill_srvs::ComputeIK srv;
	// bool solution;

	// ~manupulator_control();
private:
	// void move_arm_to_cartesian_pose();
	bool get_goal_position(edufill_srvs::CartesianPose::Request& req, edufill_srvs::CartesianPose::Response& res);
	void callback(const sensor_msgs::JointState& msg);

	// Init

	float roll,pitch,yaw,pose_x,pose_y,pose_z;
	ros::NodeHandle nh_;
	ros::Time call_t;
	ros::Time compute_t;
	ros::Duration busy_t;
	ros::ServiceServer service;
	ros::ServiceClient client;
	ros::Publisher armPositionsPublisher;
	ros::Subscriber armPositionsSubscriber;


};

void manupulator_control::callback(const sensor_msgs::JointState &msg) 
{ 
	float sumofJoints = 0;
	for (int j=8; j<8+5; j++)
	{ 
		sumofJoints += msg.position[j];	
	}
	sumofCurrentJoints = sumofJoints; 
}

manupulator_control::manupulator_control()
{
	// Client
	client = nh_.serviceClient<edufill_srvs::ComputeIK>("edufill_srvs/ComputeIK");

	// Message
	armPositionsPublisher = nh_.advertise<brics_actuator::JointPositions > ("arm_1/arm_controller/position_command", 10);

	// Service
	service = nh_.advertiseService("cartesianPose",&manupulator_control::get_goal_position, this);

	armPositionsSubscriber = nh_.subscribe ("joint_states", 1, &manupulator_control::callback, this); 	

}

bool manupulator_control::get_goal_position(edufill_srvs::CartesianPose::Request  &req, edufill_srvs::CartesianPose::Response &res)
{
	edufill_srvs::ComputeIK srv;

	// ROS_INFO("request: x=%f", (double)req.cartesian_position[0]);
	

	srv.request.tool_pose.position.x = req.cartesian_position[0];
	srv.request.tool_pose.position.y = req.cartesian_position[1];
	srv.request.tool_pose.position.z = req.cartesian_position[2];
	geometry_msgs::Quaternion target_quat = tf::createQuaternionMsgFromRollPitchYaw(req.cartesian_position[3],req.cartesian_position[4],req.cartesian_position[5]);
	srv.request.tool_pose.orientation.x = target_quat.x;
	srv.request.tool_pose.orientation.y = target_quat.y;
	srv.request.tool_pose.orientation.z = target_quat.z;
	srv.request.tool_pose.orientation.w = target_quat.w;
	call_t = ros::Time::now();

	if (client.call(srv))
	{   
		compute_t = ros::Time::now(); 
		busy_t = compute_t - call_t;
		         
		cout << "Time required for computation\n-----------------------------" << std::endl << busy_t.toSec()*1000 << " ms.\n\n";
		nvals = srv.response.joint_values.size();
		nsols = nvals/5;
		cout << "Solutions found1: " << nsols << std::endl;

		// Eigen::MatrixXf response(nsols,5);


		// int k = 0;
		// while(k<nvals)
		// {
		//   for (int i=0; i<nsols; ++i)
		//   {
		//     for (int j=0; j<5; ++j)
		//     { 
		//       response(i,j) = srv.response.joint_values[k];
		//       ++k;
		//       sumresponse += response(i,j);
		//     }
		//   } 
		// }
		// cout << "Solutions found: " << nsols << std::endl << response << std::endl;

	}


	return true;
}

bool manupulator_control::check_ik_solver_has_solution()
{
	cout << "Solutions found2 " << nsols << std::endl;
	if(nsols>0)
	{
		cout << "Solutions found: " << nsols << std::endl;
		return true;
	}
	else
	{
		return false;
	}	
}

Eigen::MatrixXf manupulator_control::get_ik_solution()
{
	if (client.call(srv))
	{   
	Eigen::MatrixXf response(nsols,5);
	// std::vector<float> response(nsols,5); 

	int k = 0;
	while(k<nvals)
	{
	  for (int i=0; i<nsols; ++i)
	  {
	    for (int j=0; j<5; ++j)
	    { 
	      response(i,j) = srv.response.joint_values[k];
	      ++k;
	      sumresponse += response(i,j);
	    }
	  } 
	}
	cout << "Solutions found: " << nsols << std::endl << response << std::endl;
	return response;
	}
}

void manupulator_control::move_arm_to_cartesian_pose()
{
	
	// move arm
	brics_actuator::JointPositions command;
	vector<brics_actuator::JointValue> armJointPositions;
	armJointPositions.resize(5);
	Eigen::MatrixXf response(nsols,5);


	int numberofSolution = 0;
	float diffsolutions = 0;
	int smS = sumresponse;
	sumresponse = 0;
	for (int i=0; i<nsols; ++i)
	{
		for (int j=0; j<5; ++j)
		{ 
			sumresponse += response(i,j);
		}
		diffsolutions = abs(sumofCurrentJoints - sumresponse);
		if(diffsolutions<smS)
		{
			smS = diffsolutions;
			numberofSolution = i;
		}
		sumresponse = 0;
	}
	// int input_row;
	// printf("Choose solution row (start with 0). Currently subscribed nodes: %d\n", armPositionsPublisher.getNumSubscribers());
	// cin >> input_row;
				
	while (armPositionsPublisher.getNumSubscribers() == 0)
	{
		printf("Waiting for subscribers...\n");
		ros::Duration(0.1).sleep();
	}

	armJointPositions[0].joint_uri = "arm_joint_1";
	armJointPositions[0].value = response(numberofSolution,0);
	armJointPositions[0].unit = boost::units::to_string(boost::units::si::radians);

	armJointPositions[1].joint_uri = "arm_joint_2";
	armJointPositions[1].value = response(numberofSolution,1);
	armJointPositions[1].unit = boost::units::to_string(boost::units::si::radians);

	armJointPositions[2].joint_uri = "arm_joint_3";
	armJointPositions[2].value = response(numberofSolution,2);
	armJointPositions[2].unit = boost::units::to_string(boost::units::si::radians);

	armJointPositions[3].joint_uri = "arm_joint_4";
	armJointPositions[3].value = response(numberofSolution,3);
	armJointPositions[3].unit = boost::units::to_string(boost::units::si::radians);

	armJointPositions[4].joint_uri = "arm_joint_5";
	armJointPositions[4].value = response(numberofSolution,4);
	armJointPositions[4].unit = boost::units::to_string(boost::units::si::radians);
	
	command.positions = armJointPositions;
	
	printf("Publishing command [%f %f %f %f %f]\n", armJointPositions[0].value, armJointPositions[1].value, armJointPositions[2].value, armJointPositions[3].value, armJointPositions[4].value); 
	
	for(int i=0; i<20; ++i)
	{
		armPositionsPublisher.publish(command);
	}
	
}




int main(int argc, char **argv)
{
	ros::init(argc, argv, "ComputeIK_test_client");
	manupulator_control youbot_cartesianPosition;
	bool solution;
	solution = youbot_cartesianPosition.check_ik_solver_has_solution();
	cout << solution;
	if(solution)
	{
		youbot_cartesianPosition.move_arm_to_cartesian_pose();
	}
	else
	{
		ROS_INFO("No solution found");
	}

	ros::spin();

}