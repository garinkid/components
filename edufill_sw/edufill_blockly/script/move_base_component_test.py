#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_blockly')
import rospy
import move_base_component

# move_base_component example script

#### 1.result = move_base_component.command(command_string,duration) 
######### command_string - "forward","backward","right","left","rotate_anticlockwise","rotate_clockwise"
######### duration - duration in seconds
######### result - 'success'/'failure'

#### 2.move_base_component.to_pose(pose) 
######### pose - [x,y,yaw]

#### 3.move_base_component.to_goal(goal_string) 
######### goal_string- 'S1'/'S2'/'D1' etc depending upon the environment/map loaded

#### 4.move_base_component.twist(base_velocity) 
######### base_velocity = [lx,ly,lz,ax,ay,az]


#### 6.move_base_component.relative(goal_behaviour) 
######### goal_behaviour = [x_translation,y_translation,z_translation,x_orientation, y_orientation,z_orientation, w_orientation]

if __name__=="__main__":
    rospy.init_node('move_base_component') 

    ### start
    pose = [0,0,0]
    result = move_base_component.to_pose(pose)
    
    #### 1.move_base_component.command(command_string,duration)
    motion_direction = "left"
    duration = 3
    result = move_base_component.command(motion_direction,duration)
    print result

    #### 2.move_base_component.to_pose(pose) 
    pose = [1,0.5,0.1]
    result = move_base_component.to_pose(pose)
    print result

    #### 3.move_base_component.to_goal(goal_string) 
    goal = 'S2'
    result = move_base_component.to_goal(goal)
    print result
    #### 6.move_base_component.relative(goal_behaviour) 
    x_move = 0
    y_move = 0.5
    z_move = 0
    x_rotate = 0.3
    y_rotate = 0.2
    z_rotate = 0.1
    w_rotate = 0.3
    goal_behaviour = [x_move,y_move,z_move,x_rotate,y_rotate,z_rotate,w_rotate]
    result = move_base_component.relative(goal_behaviour)
    print result
    #### 4.move_base_component.twist(base_velocity) 
    base_velocity = [0,0.1,0,0,0,0]
    time = 7.0
    time_taken = 0
    init_time = rospy.get_rostime().secs 
    while(init_time <= 0):
        init_time = rospy.get_rostime().secs  
    while(time_taken<time):
        now = rospy.get_rostime().secs 
        time_taken =  now - init_time
        # this is the where the real component gets called. It is in a loop to visualize
        # in gazebo as it would be difficult to see a response when you publish velocity for
        # one instant
        result = move_base_component.twist(base_velocity)
    print 'success'
    move_base_component.command('stop',1)
     '''


