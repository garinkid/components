#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_blockly')
import rospy
import read_base_component

# read_base_component example script

#### 1.msg = read_base_component.location() 
######### msg is a geometry_msgs/PoseStamped ros message

#### 2.msg = read_base_component.odometry() 
######### msg is a list = [x,y,z,r,p,y]


if __name__=="__main__":
    rospy.init_node('read_base_component_test',disable_signals=False)
    # read the current location of the robot in the map frame
    result = read_base_component.location()
    print result
    # read the odometry data of the robot 
    result = read_base_component.odometry()
    print result



