#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <geometry_msgs/Pose.h>
#include <tf/transform_datatypes.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>

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
#include <Eigen/Core>

#include "brics_actuator/JointPositions.h"
#include "brics_actuator/CartesianWrench.h"

#include <edufill_srvs/ComputeIK.h>
#include <edufill_srvs/CartesianPose.h>

using namespace std;
using namespace Eigen;

class ik_to_goal_frame
{
public:
  ik_to_goal_frame();
  // double pose_x,pose_y,pose_z;
  // double rx, ry, rz;

  tf::TransformListener listener;    
  tf::StampedTransform transform;




private:
  // void move_arm_to_cartesian_pose();
  bool get_goal_position(edufill_srvs::CartesianPose::Request& req, edufill_srvs::CartesianPose::Response& res);

  // Init

  float rx, ry, rz,pose_x,pose_y,pose_z;
  ros::NodeHandle nh_;
  ros::Time call_t;
  ros::Time compute_t;
  ros::Duration busy_t;
  ros::ServiceServer service;
  bool tf_catch;
  string desired_frame;

};


ik_to_goal_frame::ik_to_goal_frame()
{
  // Service
  service = nh_.advertiseService("/edufill_arm_geometrical_solution/CartesianPose",&ik_to_goal_frame::get_goal_position, this);
  tf_catch = false;
  desired_frame = "";

}

bool ik_to_goal_frame::get_goal_position(edufill_srvs::CartesianPose::Request  &req, edufill_srvs::CartesianPose::Response &res)
{
  printf("INFO: Launch the executable with \"home\" as following argument argument to move the arm into init position.\n");
  printf("Launch the executable with \"up\" as following argument to move the arm straight up.\n");
  printf("Note: When launched with these parameters, the arm will move without further confirmations.\n");
  printf("------------------------------------------------------\n");
  
  // printf("Please input the considered reference frame.\n");  
  // cin >> desired_frame;
  // printf("Please input desired tool goal rotation. RX RY RZ\n");
  // cin >> rx >> ry >> rz;
  // printf("Please input desired tool goal position. TX TY TZ\n");
  // cin  >> pose_x >> pose_y >> pose_z;
  desired_frame = req.desired_pose.header.frame_id;
  pose_x = req.desired_pose.position.x;
  pose_y = req.desired_pose.position.y;
  pose_z = req.desired_pose.position.z;
  rx = req.desired_pose.rotation.x;
  ry = req.desired_pose.rotation.y;
  rz = req.desired_pose.rotation.z;

  // 2. Get transform matrix G_d from desired_frame to goal frame
  Vector3d P_d(pose_x, pose_y, pose_z);
  Matrix3d G_d_rot;
  G_d_rot = AngleAxisd(rx, Vector3d::UnitX()) * AngleAxisd(ry, Vector3d::UnitY()) * AngleAxisd(rz, Vector3d::UnitZ());
  
  // transform G_d to a homogeneous transform matrix type
  Matrix4d G_d;
  G_d.row(3) << 0, 0, 0, 1;
  G_d(0,3) = P_d(0);
  G_d(1,3) = P_d(1);
  G_d(2,3) = P_d(2);
  for(int i=0; i<3; ++i)
  {
    for(int j=0; j<3; ++j)
    {
      G_d(i,j) = G_d_rot(i,j); 
    }
  }  
  
  cout << "Transformation from desired frame to goal:" << endl << G_d << endl << "------------------------------------------" << endl;
  
  
  // 3. Get transform matrix TF from desired_frame to IK_solver frame
  // lookup the transform matrix A and the translation vector from desired_frame to IK_solver_frame
  
  // -- NOTE -- 
  // Since the IK solver frame is not fixed (arm_link_1), we take the orientation of arm_link_0 (which is fixed),
  // and use the translation of arm_link_1
  // ----------
  
  // translation from desired frame to IK_solver frame
  cout << "tf_catch" << tf_catch;
  while(!tf_catch)
  {
    try
    {
      listener.waitForTransform(desired_frame, "/arm_link_1", ros::Time(0),ros::Duration(0.2));
      listener.lookupTransform(desired_frame, "/arm_link_1", ros::Time(0), transform);
      tf_catch = true;
    }
    catch (tf::TransformException ex)
    {
      ROS_ERROR("%s",ex.what());
    } 
  }  
  tf::Vector3 bt_p = transform.getOrigin();
 
  // "dummy" orientation (aligned with arm_link_0) from desired frame to IK_solver frame
  // Let's keep the Identity if we consider as reference frame the same as the solver's DH table (arm_link_1 with fixed orientation)
  tf::Matrix3x3 bt_A;
  bt_A.setIdentity();
  if( desired_frame != "arm_link_1" )
  {
    tf_catch = false;
    while(!tf_catch)
    {
      try
      {
        listener.waitForTransform(desired_frame, "/arm_link_0", ros::Time(0),ros::Duration(0.1));
        listener.lookupTransform(desired_frame, "/arm_link_0", ros::Time(0), transform);
        tf_catch = true;
      }
      catch (tf::TransformException ex)
      {
        ROS_ERROR("%s",ex.what());
      } 
    }   
    // get, from the tf, the affine transformation
    bt_A = transform.getBasis();
  }
  printf("Rotation from tf:\n %f %f %f \n %f %f %f \n %f %f %f\n",bt_A[0][0],bt_A[0][1],bt_A[0][2],bt_A[1][0],bt_A[1][1],bt_A[1][2],bt_A[2][0],bt_A[2][1],bt_A[2][2]);
  printf("Translation from tf:\n %f %f %f\n",bt_p[0], bt_p[1], bt_p[2]);
  
  // set up the Eigen data type 
  Matrix4d Eig_A;
  // copy the bullet matrix A to an equivalent Eigen matrix
  for(int i=0; i<3; ++i)
  {
    for(int j=0; j<3; ++j)
    {
      Eig_A(i,j) = bt_A[i][j]; 
    }
  }
  Eig_A.row(3) << 0, 0, 0, 1;
  Eig_A(0,3) = bt_p[0];
  Eig_A(1,3) = bt_p[1];
  Eig_A(2,3) = bt_p[2];
  //cout << "Transformation from desired frame to IK solver frame:" << endl << Eig_A << endl << "-----------------------------------------------------" << endl;
 
  // 4. Get transform matrix G_IK from IK_solver frame to goal frame
  Matrix4d G_ik;
  G_ik = Eig_A.inverse()* G_d;
  cout << "Transformation from IK solver frame to goal frame:" << endl << G_ik << endl << "--------------------------------------------------" << endl;
  
  // 5. Translation from rotation matrix to quaternion
  Matrix3d G_ik_rot;
  Vector3d P_ik;
   for(int i=0; i<3; ++i)
  {
    for(int j=0; j<3; ++j)
    {
        G_ik_rot(i,j) = G_ik(i,j); 
    }
    P_ik(i) = G_ik(i,3);
  } 
  Eigen::Quaternion<double> Eig_target_q;
  Eig_target_q = Eigen::Quaternion<double>(G_ik_rot);
    
  res.goal_pose.position.x = P_ik(0);
  res.goal_pose.position.y = P_ik(1);
  res.goal_pose.position.z = P_ik(2);
  res.goal_pose.orientation.x = Eig_target_q.x();
  res.goal_pose.orientation.y = Eig_target_q.y();
  res.goal_pose.orientation.z = Eig_target_q.z();
  res.goal_pose.orientation.w = Eig_target_q.w();
  tf_catch = false;
  return true;
}


int main(int argc, char **argv)
{
  ros::init(argc, argv, "ComputeIK_test_client");
  ik_to_goal_frame youbot_cartesianPosition;

  ros::spin();

}