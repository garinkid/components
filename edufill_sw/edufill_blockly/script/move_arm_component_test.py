#!/usr/bin/env python

#default import
import roslib; roslib.load_manifest("edufill_blockly")
import rospy
import move_arm_component  #import component

# move_arm_component example script

#### 1.move_arm_component.to_pose(pose_string) 
######### command_string-'OPEN'/'CLOSE'  

#### 2.move_arm_component.to_joint_positions(joint_positions) 
######### joint_positions = [jv1,jv2,jv3,jv4,jv5]

#### 3.move_arm_component.to_cartesian_pose([x,y,z,roll,pitch,yaw], reference_frame)
######### reference_frame = "/base_link" (or) any defined frame of reference

#### 4.move_arm_component.joint_velocities(joint_velocities)
######### joint_velocities = [jv1,jv2,jv3,jv4,jv5]


if __name__=="__main__":
    rospy.init_node('move_arm_component_test')
    '''
    #### 1.move_arm_component.to_pose(pose_string) 
    move_arm_component.to_pose('initposition') 
    rospy.sleep(5.0)
    '''
    #### 2.move_arm_component.to_joint_positions(joint_positions) 
    joint_positions = [0.4100692,2.61799,0.1,0.1,0.1]
    move_arm_component.to_joint_positions(joint_positions)
    rospy.sleep(5.0)
    '''
    #### 3.move_arm_component.to_cartesian_pose([x,y,z,roll,pitch,yaw], reference_frame)
    x = 0.024 + 0.033
    y = 0
    z = 0.535
    roll = 0 
    pitch = 0
    yaw = 0
    move_arm_component.to_cartesian_pose([x,y,z,roll,pitch,yaw], "/base_link")
    rospy.sleep(5.0)
    #### 4.move_arm_component.joint_velocities(joint_velocities)
    time = 5.0
    time_taken = 0
    init_time = rospy.get_rostime().secs 
    while(init_time <= 0):
        init_time = rospy.get_rostime().secs  
    print 'init time recorded is ' + repr(init_time) +' secs'
    #timer = rospy.Timer(rospy.Duration(1), my_callback)
    while(time_taken<time):
        now = rospy.get_rostime().secs 
        time_taken =  now - init_time
        result = move_arm_component.joint_velocities([0.05,0.0,0.0,0,0])
    result = move_arm_component.joint_velocities([0.0,0,0,0,0])
    rospy.sleep(5.0)
    '''

