#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_blockly')
import rospy
import detect_objects

# detect object example script

#### 1.resp = detect_objects.cube(color) 
######### msg is geometry_msgs/Pose3D pose
######### color is 'red','green' or 'yellow'

if __name__=="__main__":
    rospy.init_node('detect_object_component_test')
    # detect cube
    color = 'red'
    resp = detect_objects.cube(color)  
    print resp



