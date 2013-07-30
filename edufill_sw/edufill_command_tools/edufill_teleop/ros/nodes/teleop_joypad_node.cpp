/*
 * teleop_joypad_node.cpp
 *
 *  Created on: Dec 15, 2011
 *      Author: Frederik Hegger
 */

#include "teleop_joypad.h"

int main(int argc, char **argv)
{
    ros::init(argc, argv, "raw_teleop_joypad");
    ros::NodeHandle nh("~");

    hbrs::TeleOpJoypad* teleop = new hbrs::TeleOpJoypad(nh);

    ros::Rate loop_rate(50);

    ros::spin();

    delete teleop;
}

