#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_blockly')
import rospy
import mapping_component
import move_base_component
import subprocess
import os

# mapping_component example script


#### 1.mapping_component.start() 

#### 2.mapping_component.stop(file_name) 
######### file_name - string 


if __name__=="__main__":
    rospy.init_node('mapping_component') 
    #### 1.mapping_component.start() 
    mapping_component.start()
    #### Move through the environment
    ######## The user can use some exploration strategy like wall follower
    ######## to get some nice data scans to perform SLAM
    move_base_component.command('forward',7)
    #move_base_component.to_goal('S2')
    #move_base_component.to_goal('S3')
    #move_base_component.to_goal('D1')
    #### 2.mapping_component.stop(file_name) 
    file_name = 'map_new'
    mapping_component.store(file_name)
    mapping_component.stop()
    #subprocess.Popen(cwd ='../common')



