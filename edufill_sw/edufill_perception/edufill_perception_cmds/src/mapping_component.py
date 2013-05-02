#!/usr/bin/python
import roslib; roslib.load_manifest('edufill_perception_cmds')
import rospy
import std_srvs.srv
import edufill_srvs.srv
import hbrs_srvs.srv
import os
import thread
import time
import subprocess

# Move arm to a cartesian position
slam_proc = 0
    
def start():
    os.system('rosparam set use_sim_time true')
    start_slam = 'roslaunch edufill_2dslam 2dslam.launch'
    global slam_proc
    slam_proc = subprocess.Popen(start_slam, shell=True)
    rospy.sleep(5)
    return 1

def stop():
    os.system('rosnode kill /slam_gmapping')
    global slam_proc
    return 1

def store(file_name):
    os.chdir(roslib.packages.get_pkg_dir('edufill_blockly') + '/map')
    os.system('rosrun map_server map_saver -f'+' '+ file_name)

if __name__ == '__main__':
    result = start()
    result = store('test_map')
    result = stop()
    print 1


