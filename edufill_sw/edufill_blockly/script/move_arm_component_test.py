#!/usr/bin/env python

#default import
import roslib; roslib.load_manifest("edufill_blockly")
import rospy
import move_arm_component  #import component
from arm_kinematics import *

# move_arm_component example script

#### 1.move_arm_component.to_pose(pose_string) 
######### command_string-'OPEN'/'CLOSE'  

#### 2.move_arm_component.to_joint_positions(joint_positions) 
######### joint_positions = [jv1,jv2,jv3,jv4,jv5]

#### 3.move_arm_component.to_cartesian_pose([x,y,z,roll,pitch,yaw], reference_frame)
######### reference_frame = "/base_link" (or) any defined frame of reference

#### 4.move_arm_component.to_cartesian_pose([x,y,z,roll,pitch,yaw])
######### [x,y,z,roll,pitch,yaw] cartesian coordinats

#### 5.move_arm_component.joint_velocities(joint_velocities)
######### joint_velocities = [jv1,jv2,jv3,jv4,jv5]

#### 5.move_arm_component.cartesian_velocities(cartesian_velocities,reference_frame)
######### cartesian_velocities = [xvel,yvel,zvel,rvel,pvel,yvel]
######### reference_frame = "/base_link" (or) any defined frame of reference

if __name__=="__main__":
    rospy.init_node('move_arm_component_test')

    #### 1.move_arm_component.to_pose(pose_string) 
    # move_arm_component.to_pose('zeroposition') 
    # rospy.sleep(5.0)

    # #### 2.move_arm_component.to_joint_positions(joint_positions) 
    # joint_positions = [2.9496, 1.13446, -2.61799388, 3.57, 2.93075]
    # move_arm_component.to_joint_positions(joint_positions)
    # rospy.sleep(5.0)

    # #### 3.move_arm_component.to_cartesian_pose([x,y,z,roll,pitch,yaw], reference_frame)
    # kinematics_solver = KinematicsSolver(AnalyticalSolver())
    # kinematics_solver.to_cartesian_pose([0.057, 0, 0.535, 0, 0, 0], "/arm_link_0")
    # print result
    # #### 4.move_arm_component.check_ik_solver_has_solution([x,y,z,roll,pitch,yaw], reference_frame)
    # ##### Return True if solution exist else False
    # kinematics_solver = KinematicsSolver(AnalyticalSolver())
    # result = kinematics_solver.check_ik_solver_has_solution([0.057, 0, 0.535, 0, 0, 0], "/arm_link_0")
    # print result
    # #### 5.move_arm_component.get_ik_solution([x,y,z,roll,pitch,yaw], reference_frame)
    # ##### Return list of joint angles  
    # kinematics_solver = KinematicsSolver(AnalyticalSolver())
    # result = kinematics_solver.get_ik_solution([0.057, 0, 0.535, 0, 0, 0], "/arm_link_0")[0.6, 0, 0.5, 0, 1.5708, 1]
    # print result
    #### 6.(change mode) to_cartesian_pose([x,y,z,roll,pitch,yaw], reference_frame)
    ##### Return True if solution exist else False
    kinematics_solver = KinematicsSolver(GeometricalSolver())
    print "IK"
    if kinematics_solver.check_ik_solver_has_solution([0.057, 0, 0.535, 0, 0, 0], "/arm_link_0"):
        joint_angles = kinematics_solver.get_ik_solution([0.057, 0, 0.535, 0, 0, 0], "/arm_link_0")
        #print joint_angles 
        move_arm_component.to_joint_positions(joint_angles)
        ik_result = True
        print ik_result
    else:
        ik_result = False
        print ik_result
    # #### 7.move_arm_component.joint_velocities(joint_velocities)
    # time = 5.0
    # time_taken = 0
    # init_time = rospy.get_rostime().secs 
    # while(init_time <= 0):
    #     init_time = rospy.get_rostime().secs  
    # print 'init time recorded is ' + repr(init_time) +' secs'
    # #timer = rospy.Timer(rospy.Duration(1), my_callback)
    # while(time_taken<time):
    #     now = rospy.get_rostime().secs 
    #     time_taken =  now - init_time
    #     result = move_arm_component.joint_velocities([0.05,0.0,0.0,0,0])
    # result = move_arm_component.joint_velocities([0.0,0,0,0,0])
    # rospy.sleep(5.0)
    # #### 8.move_arm_component.cartesian_velocities(cartesian_velocities,reference_frame)
    # cartesian_velocities = [0.0,0.0,0.05,0.0,0.0,0.0]
    # reference_frame = "/base_link"
    # move_arm_component.cartesian_velocities(cartesian_velocities,reference_frame)

