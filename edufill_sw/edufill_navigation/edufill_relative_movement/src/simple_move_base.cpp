#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
// #include <yb_simple_move/MoveToRelativePos.h>
#include <edufill_srvs/MoveToRelativePos.h>
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>
#include "trajectory_msgs/JointTrajectory.h"
#include <boost/units/io.hpp>
#include <boost/units/systems/angle/degrees.hpp>
#include <boost/units/conversion.hpp>
#include <boost/units/systems/si/length.hpp>
#include <boost/units/systems/si/plane_angle.hpp>
#include <boost/units/io.hpp>
#include <boost/units/systems/angle/degrees.hpp>
#include <boost/units/conversion.hpp>
#include <iostream>
#include <cmath>
#include <math.h>

#define _USE_MATH_DEFINES

using namespace std;

class simple_move_base
{
  public:
    simple_move_base();
    bool arrived;
  
  private:
    void odomCallback(const nav_msgs::Odometry::ConstPtr& omsg);
    void setGoal(const geometry_msgs::PoseStamped::ConstPtr& pmsg);
    bool moveToRelativePose(edufill_srvs::MoveToRelativePos::Request  &req,
                              edufill_srvs::MoveToRelativePos::Response &res);
    
    ros::NodeHandle nh_;
    
    ros::Subscriber youbot_odom_sub;
    ros::Subscriber youbot_goal_sub;
    ros::Publisher twist_pub;
    
      ros::ServiceServer service;
      tf::TransformListener tf_listener;
    
    ros::Time current_time;
    ros::Time last_time;
    // float x_g, y_g, z_g, theta_g;
    // float x_r, y_r, z_r, theta_r, vx_r, vy_r, omega_r;
    // float k_align, k_distance;
    // float align_err, distance_err;
    // float dx, dy, linear_speed[3], angular_speed[3], beta, alpha;
    // float vx,vy, omega, d_vx, d_vy, d_omega;
    float x_g, y_g, z_g, theta_g;
    float x_r, y_r, z_r, theta_r, vx_r, vy_r, omega_r;
    float k_p_align, k_p_distance, k_i_align, k_i_distance, k_d_align, k_d_distance;
    float align_err, distance_err, distance_err_last,align_err_last;
    float dx, dy, linear_speed[3], angular_speed[3], beta, alpha;
    float vx,vy, omega;
    float vx_p,vy_p, omega_p, vx_i,vy_i, omega_i, vx_d,vy_d, omega_d; 
    float d_vx, d_vy, d_omega;
  
    geometry_msgs::Quaternion goal_quat;
    geometry_msgs::Quaternion robot_quat;
    geometry_msgs::Twist robot_twist;
};

simple_move_base::simple_move_base()
{
  x_r = 0.0;
  y_r = 0.0;
  z_r = 0.0;
  theta_r = 0.0;
  
  x_g = 0.0;
  y_g = 0.0;
  z_g = 0.0;
  theta_g = 0.0;
  
  // k_align = 1.25;
  // k_distance = 0.25;
  
  // temporal gains: limit in gains per message (@50Hz)
  // d_vx = 0.0175;
  // d_vy = 0.0175;
  // d_omega = 0.1;
  
  // arrived = true;
  
  k_p_align = 1.25;
  k_p_distance = 0.25;
  k_i_align = 2/5;                   
  k_i_distance = 2/5;                   
  k_d_align = 0.001; 
  k_d_distance = 0.001;

  distance_err_last = 0;
  align_err_last = 0; 

  
  // temporal gains: limit in gains per message (@50Hz)
  d_vx = 0.0175;
  d_vy = 0.0175;
  d_omega = 0.1;
  
  youbot_goal_sub = nh_.subscribe<geometry_msgs::PoseStamped>("move_base_simple/goal",10, &simple_move_base::setGoal, this);
  youbot_odom_sub = nh_.subscribe<nav_msgs::Odometry>("odom",10, &simple_move_base::odomCallback, this);
  twist_pub = nh_.advertise<geometry_msgs::Twist>("cmd_vel",10);

  service = nh_.advertiseService("move_to_relative_pos", &simple_move_base::moveToRelativePose, this);

  last_time = ros::Time::now();
  current_time = ros::Time::now();
}

bool simple_move_base::moveToRelativePose(edufill_srvs::MoveToRelativePos::Request  &req,
                                         edufill_srvs::MoveToRelativePos::Response &res)
{ 
  
  ROS_INFO("request: x=%f, y=%f, theta=%f", req.goal.x, req.goal.y, req.goal.theta);
  
  res.result = 1;
  
  tf::StampedTransform transform_b2y;
    try
    {
      tf_listener.waitForTransform("/odom", "/base_link", ros::Time(0), ros::Duration(10.0) );
      tf_listener.lookupTransform("/odom", "/base_link",  ros::Time(0), transform_b2y);
    }
    catch (tf::TransformException ex){
      ROS_ERROR("%s",ex.what());
      res.result = 0;
    }
  
  tf::Transform transform_y2g;
  transform_y2g.setOrigin(tf::Vector3(req.goal.x, req.goal.y, 0));
  transform_y2g.setRotation(tf::createQuaternionFromRPY(0, 0 , req.goal.theta));
  
  tf::Transform result;
  result = transform_b2y * transform_y2g;
  
  tf::Quaternion qg = result.getRotation();
  tf::Vector3 vg = result.getOrigin();
  double roll, pitch, yaw;
  
  result.getBasis().getRPY(roll, pitch, yaw);

  
  cout << "Transform /odom to /goal" << endl;
    cout << "- Translation: [" << vg.getX() << ", " << vg.getY() << ", " << vg.getZ() << "]" << endl;
    cout << "- Rotation: in Quaternion [" << qg.getX() << ", " << qg.getY() << ", " << qg.getZ() << ", " << qg.getW() << 
         "]" << endl;
    cout << "- RPY: Roll:" << roll << " Pitch:" << pitch << " Yaw:" << yaw << endl;

  arrived = false;
  // get the goal cartesian data
  x_g = vg.getX();
  y_g = vg.getY();
  
  // get the goal orientation data
    goal_quat.x = qg.getX();
  goal_quat.y = qg.getY();
  goal_quat.z = qg.getZ();
  goal_quat.w = qg.getW();
  
    theta_g = tf::getYaw(goal_quat);

  
  return true;
}
void simple_move_base::setGoal(const geometry_msgs::PoseStamped::ConstPtr& msg)
{
    arrived = false;
  // get the goal cartesian data
  x_g = msg->pose.position.x;
  y_g = msg->pose.position.y;
  z_g = msg->pose.position.z;
  
  // get the goal orientation data
  goal_quat.x = msg->pose.orientation.x;
  goal_quat.y = msg->pose.orientation.y;
  goal_quat.z = msg->pose.orientation.z;
  goal_quat.w = msg->pose.orientation.w;
  theta_g = tf::getYaw(goal_quat);

  printf("Goal set: [%f %f]; theta: [%f]\n",simple_move_base::x_g,simple_move_base::y_g,simple_move_base::theta_g);
}

void simple_move_base::odomCallback(const nav_msgs::Odometry::ConstPtr& msg)
{   
  ros::Rate loop_rate(50);
  
  if(arrived == false)
  {
    // get odometry data (coord, orientation)
    x_r = msg->pose.pose.position.x;
    y_r = msg->pose.pose.position.y;
    z_r = msg->pose.pose.position.z;
    vx_r = msg->twist.twist.linear.x;
    vy_r = msg->twist.twist.linear.y;
    omega_r = msg->twist.twist.angular.z;
    
    robot_quat.x = msg->pose.pose.orientation.x; 
    robot_quat.y = msg->pose.pose.orientation.y;
    robot_quat.z = msg->pose.pose.orientation.z;
    robot_quat.w = msg->pose.pose.orientation.w;
    theta_r = tf::getYaw(robot_quat);
    
    // compute cartesian distances from goal to robot
    dx = x_g - x_r;
    dy = y_g - y_r;
    align_err = theta_g - theta_r;
    //align_err = alpha;    
    // are we more than 1cm or half a degree far from our target location?
    if (abs(dx) > 0.01 || abs(dy) > 0.01 || abs(align_err) > 0.01)
    {
      distance_err = sqrt( pow(dx,2) + pow(dy,2) );
      if (distance_err > 1.25)
      {
        distance_err = 1.25;
      }
      beta = atan2(dy,dx); 
      alpha = atan2(dy,dx) - theta_r;
      
      // compute new velocity commands
      // vx = k_distance * cos(alpha) * distance_err;
      // vy = k_distance * sin(alpha) * distance_err;
      // omega = k_align * align_err;
      // compute new velocity commands
      vx_p = k_p_distance * distance_err;
      vx_i = k_i_distance  * (vy_i + distance_err); 
      vx_d = k_d_distance * (distance_err - distance_err_last);
      vx = cos(alpha) * (vx_p + vx_i + vx_d);

      vy_p = k_p_distance * distance_err;
      vy_i = k_i_distance  * (vy_i + distance_err); 
      vy_d = k_d_distance * (distance_err - distance_err_last);
      vy = sin(alpha) * (vy_p + vy_i + vy_d);
      
      omega_p = k_p_align * align_err;
      omega_i = k_i_align * (omega_i - align_err);
      omega_d = k_d_align * (align_err - align_err_last);
      omega = omega_p + omega_i + omega_d ; 
      
      distance_err_last = distance_err;
      align_err_last = align_err;
      
      // filter the commands to avoid control spikes (only in acceleration)
      if (abs(vx - vx_r) > d_vx)
      {
        vx > vx_r ? vx = vx_r + d_vx : vx = vx_r - d_vx;
        
      }
      if (abs(vy - vy_r) > d_vy)
      {
        vy > vy_r ? vy = vy_r + d_vy : vy = vy_r - d_vy;
      }
      if (abs(omega - omega_r) > d_omega)
      {
        omega > omega_r ? omega = omega_r + d_omega : omega = omega_r - d_omega;
      }
      
      // assign the commands to the message field    
      linear_speed[0] = vx;
      linear_speed[1] = vy;
      angular_speed[2] = omega;
        
      // saturation of omega
      if (angular_speed[2] < -0.4 || angular_speed[2] > 0.4)
      {
        angular_speed[2] < -0.4 ? angular_speed[2] = -0.4 : angular_speed[2] = 0.4;
      }
  
      //printf("cmd_vel.x = %f, cmd_vel.y = %f, cmd_vel.z = %f\n", vx, vy, angular_speed[2]);
  
    } 
    else
    {
      printf("We are at the goal position\n");
      linear_speed[0] = 0;
      linear_speed[1] = 0;
      angular_speed[2] = 0;
      arrived = true;
    }
    // fill the message
    robot_twist.linear.x = linear_speed[0];
    robot_twist.linear.y = linear_speed[1];
    robot_twist.angular.z = angular_speed[2];
    
    // publish the message
    twist_pub.publish(robot_twist);
  }
  loop_rate.sleep();
}

int main(int argc, char** argv)
{
  ros::init(argc,argv,"simple_move_base");
  simple_move_base youbot_odom;
  ros::spin();
}
