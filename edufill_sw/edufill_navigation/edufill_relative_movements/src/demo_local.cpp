#include "ros/ros.h"
#include "std_msgs/String.h"
#include <iostream>
#include <sstream>
#include <string>
#include <edufill_srvs/MotionCommand.h>
#include <tf/transform_datatypes.h>
#include "tf/transform_listener.h"
#include "geometry_msgs/Twist.h"
#include <angles/angles.h>

using namespace std;

double Velocity = 0.05;


class demo_controller

{

   public:
   demo_controller()
   {
        // Velocity control for the YouBot base.
        base_velocities_publisher = node_handler.advertise<geometry_msgs::Twist>( "/cmd_vel", 1 );
        //Advertise service
        update_command_server = node_handler.advertiseService("update_motion_command",&demo_controller::update_motion_command,this);
        ROS_INFO("youbot base velocity is %ld",(long int)youbot_base_velocity.linear.x);
        //Publish velocity
        //publishVelocity();
   }
   ~demo_controller()
   {
        base_velocities_publisher.shutdown(); 
   }

   void publishVelocity()
   {

        base_velocities_publisher.publish(youbot_base_velocity);

   }
   private:

   // Velocity Components
   float xvel;
   float yvel;
   float yawval;

   //NodeHandle
   ros::NodeHandle node_handler;

   // Odometry subscriber and Base Velocity Publisher
   ros::Publisher   base_velocities_publisher;   

   //base velocity topic message
   geometry_msgs::Twist youbot_base_velocity;
   ros::ServiceServer update_command_server;

   bool update_motion_command(edufill_srvs::MotionCommand::Request& req, edufill_srvs::MotionCommand::Response& res)
   {
      
      geometry_msgs::Twist zero_vel;

      string motion_command = req.command;

      if(motion_command == "forward")
      {
           ROS_INFO("fwd");
	   youbot_base_velocity.linear.x = 0.05;
           ROS_INFO("youbot base velocity is %f",(float)youbot_base_velocity.linear.x);

      }
      else if(motion_command == "backward")
      {
           ROS_INFO("bwd");
           youbot_base_velocity.linear.x = -Velocity;

      }
      else if(motion_command == "right")
      {

	   youbot_base_velocity.linear.y = Velocity;
  
      }
      else if(motion_command == "left")
      {

	   youbot_base_velocity.linear.y = -Velocity;
  

      }
      else if(motion_command == "stop")
      {
           youbot_base_velocity = zero_vel;
      }
      else
      {
           ROS_INFO("Wrong Command");
           return false;
      }  
      ROS_INFO("Motion Command Updated");
      return true;
   } 
      
   
};

 

int main(int argc, char **argv)
{  
  ros::init(argc, argv, "demo_local");


  demo_controller dc;

  while(ros::ok())
  {
  	dc.publishVelocity();
  	//ROS_INFO("Publishing Velcocity");
        ros::spinOnce();

  }


}
