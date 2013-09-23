Edufill Components 
==========
# Pre-Installation :
The installation of the Edufill software components required installation of following:
- Operating System : Ubuntu 12.04
- Software Framework : ROS Fuerte
- Version Control: Git


## Ubuntu installation
### Ubuntu 12.04 
The distribution can be download via link below: 

    http://www.ubuntu.com/download/desktop
  
The installation tutorial can be found here:

    http://www.ubuntu.com/download/desktop/install-desktop-long-term-support

## Robotic Operating System (ROS)
In order to operate a robot the software framework ROS has to be installed. Version which was verified with our components is "fuerte".
### ROS Fuerte installation
Installation instructions for "ros-fuerte-desktop-full" is on:

    http://wiki.ros.org/fuerte/Installation/Ubuntu

Follow the step by step instruction for installation. For thought user who never work with ROS before, we recommend to start with beginner level of ROS tutorials:

    http://wiki.ros.org/ROS/Tutorials


## Git Software Installation
If git was not installed automatically with Ubuntu installation:

    sudo apt-get install

The git core components and git GUI can be installed via command:

    sudo apt-get install gitk gitg git-core
    
Git can be configuration by user name and email which will be associated with your commits

    git config --global user.name "YOUR NAME"
    git config --global user.email "YOUR@EMAIL.COM"


# Automatic Installation

Users who does not want investigate in installation of EduFIll software components can download shell script for automatic installation from:

    www.edufill.org

This script has to be executed in terminal in directory where you what to store the EduFill components:

    ./EduFill.sh
    
This process takes time bacause it is installing all possible dependences for the EduFill components. Within
the process, user will be asked permission several time for executing commands that require different privilege. If there is no error occur, the user will be notified upon completion: **Instlation finish** . Additionally, within
the directory where the *EduFill.sh* script was executed, two additional directory will be created, components and external_software.

# Manual Installation

The manual installation requires more advance knowledge and give more flexibility.

## Install dependences:

    sudo apt-get install python-rosinstall python-setuptools
    
## Clone EduFill software components:

We recommend create new directory for EduFill components. In new terminal window:

    mkdir ~/ros
    cd ~/ros
Then the git repository can be clone there:

    git clone https://github.com/EduFill/components

## Install EdiFill component dependences:

The further dependences need to be installed:

edufill components

     cd ~/ros
    ./components/edufill_sw/repository.debs
    mkdir external_software
    cd components/edufill_sw/
    rosinstall ../../external_software /opt/ros/fuerte ./repository.rosinstall
    
hbrs-ros-package

    cd ~/ros
    ./external_software/hbrs-ros-pkg/repository.debs
    cd external_software/hbrs-ros-pkg/ rosinstall ../../external_software
    /opt/ros/fuerte ./repository.rosinstall


## Setup environment variables

Use your favorite text editor (vim, nano, gedit) to modify your *.bashrc* file. In most cases, *.bashrc* file is located in the user directory (for example */home/<user_name>*) and it is a hidden file. Add the following lines to the *.bashrc* file.
      
      vim ~/.bashrc
      
### ROBOT

Define which robot to be used within ROS. The EduFill software toolbox accommodate three different robot
which are *youbot-edufill*, *nxt-arm* and *nxt-base*

    export ROBOT=youbot-edufill

### ROBOT_ENV
The variable ROBOT_ENV define which robot environment to be used within ROS (i.e. for the navigation component). There are five different environment are available for simulation (brsu-home, edufill_domestic,  edufill_maze, edufill_maze_big, and edufill_maze_island)

    export ROBOT_ENV=brsu-home

### ROS_PACKAGE_PATH
The variable ROS_PACKAGE_PATH is to include the directory where you install EduFill components in the ROS package directory.

    export ROS_PACKAGE_PATH=/home/user/...../ros:$ROS_PACKAGE_PATH
    
###  Set variables to system
To set the variable you need to perform :

    source ~/.bashrc

in each terminal that is opened or close all of them.

## Build the Edufill software components:
EduFill software component can be build using the following commands:

    rosmake edufill_blockly


