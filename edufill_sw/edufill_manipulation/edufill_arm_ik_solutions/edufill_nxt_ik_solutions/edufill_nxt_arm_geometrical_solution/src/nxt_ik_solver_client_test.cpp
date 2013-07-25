#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <geometry_msgs/Pose.h>

#include <iostream>
#include <assert.h>
#include <cmath>

#include <Eigen/Geometry>
#include <Eigen/Core>

#include <edufill_nxt_arm_geometrical_solution/ik_service.h>

using namespace std;

int main(int argc, char **argv)
{
	// Init
	double pose_x,pose_y,pose_z;
  
  ros::init(argc, argv, "nxt_ik_test_client");

	// Service
  ros::NodeHandle nh_;
  ros::ServiceClient client = nh_.serviceClient<edufill_nxt_arm_geometrical_solution::ik_service>("edufill_nxt_arm_geometrical_solution/ik_service");
  edufill_nxt_arm_geometrical_solution::ik_service srv;
  srv.request.xyz.resize(3);
  
  // Message
  sensor_msgs::JointState armJointPositions;
  armJointPositions.name.resize(3);
  armJointPositions.position.resize(3);
  armJointPositions.velocity.resize(3);
  armJointPositions.effort.resize(3);
  
  // Publisher
  ros::Publisher armPositionsPublisher;
  armPositionsPublisher = nh_.advertise<sensor_msgs::JointState > ("position_controller", 10);
  
  printf("Input tool goal position as a vector [PX PY PZ], then press Enter.\n");
  printf("NOTE: Frame origin is at ground height and under the axis of rotation of joint 1.\n");
  cin >> pose_x >> pose_y >> pose_z;
 
  srv.request.xyz[0] = pose_x;
  srv.request.xyz[1] = pose_y;
  srv.request.xyz[2] = pose_z;	
 
  if (client.call(srv))
  {   
    int nvals = srv.response.joint_values.size();
    int nsols = nvals/4;
    Eigen::MatrixXd response(nsols,4);
    
    int k = 0;
    while(k<nvals)
    {
      for (int i=0; i<nsols; ++i)
      {
        for (int j=0; j<4; ++j)
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
            
      while (armPositionsPublisher.getNumSubscribers() < 1)
      {
        printf("Waiting for subscribers...\n");
        ros::Duration(0.1).sleep();
      }
      armJointPositions.name[0] = "arm_joint_1";
      armJointPositions.position[0] = response(input_row, 0);
      armJointPositions.name[1] = "arm_joint_2";
      armJointPositions.position[1] = response(input_row, 1);
      armJointPositions.name[2] = "arm_joint_3";
      armJointPositions.position[2] = response(input_row, 2);

      for(int i=0; i<5; ++i)
      {
        armPositionsPublisher.publish(armJointPositions);
        ros::Duration(0.001).sleep();
      }
    }
    
  }
  else
  {
    ROS_ERROR("Failed to call service edufill_nxt_arm_geometrical_solution/ik_service");
    return -1;
  }

  return 0;
}
