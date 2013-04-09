#!/usr/bin/python
import roslib; roslib.load_manifest('edufill_base_cmds')
import rospy
import brics_actuator.msg
import actionlib
import sys
import tf
import math
import edufill_srvs.srv
import std_srvs.srv
# msg imports
from geometry_msgs.msg import *
from move_base_msgs.msg import *

# msg imports
from geometry_msgs.msg import *
from move_base_msgs.msg import *


def twist(base_velocity):
    # base_velocity = [lx,ly,lz,ax,ay,az]
    pub = rospy.Publisher("/cmd_vel",Twist)
    youbot_base_velocity = Twist()
    youbot_base_velocity.linear.x = base_velocity[0]
    youbot_base_velocity.linear.y = base_velocity[1]
    youbot_base_velocity.linear.z = base_velocity[2]
    youbot_base_velocity.angular.x = 0
    youbot_base_velocity.angular.y = 0
    youbot_base_velocity.angular.z = base_velocity[5]
    pub.publish(youbot_base_velocity)


# Move arm to a cartesian position
def to_pose(pose):
    x = pose[0]
    y = pose[1]
    yaw = pose[2] 
    try: 

        # convert to pose message
        pose = PoseStamped()
        pose.header.stamp = rospy.Time.now()
        pose.header.frame_id = "/map"
        pose.pose.position.x = x
        pose.pose.position.y = y
        pose.pose.position.z = 0.0
        q = tf.transformations.quaternion_from_euler(0, 0, yaw)
        pose.pose.orientation.x = q[0]
        pose.pose.orientation.y = q[1]
        pose.pose.orientation.z = q[2]
        pose.pose.orientation.w = q[3]

        action_server_name = "/move_base"
        client = actionlib.SimpleActionClient(action_server_name, MoveBaseAction)
        client_goal = MoveBaseGoal()
        client_goal.target_pose = pose 
        client.wait_for_server()
        # send goal
        client.send_goal(client_goal)
        client.wait_for_result()
        return 'success'

    except Exception, e:
        rospy.logerr("service call <<%s>> failed: %s", self.move_base_relative_srv_name, e)  
        return 'srv_call_failed'

def to_goal(goal):

    if (not rospy.has_param("script_server/base/" + goal)):
        rospy.logerr("location <<" + goal + ">> is not on the parameter server")
        return 'location_not_known'
    
    pose = rospy.get_param("script_server/base/" + goal)   
    result = to_pose(pose)  
  
    return result    

def relative(goal):
    while not rospy.is_shutdown():
        pose = PoseStamped()
        pose.header.frame_id = "/map"
        pose.header.stamp = rospy.Time.now()
        pose.pose.position.x = goal[0]
        pose.pose.position.y = goal[1]
        pose.pose.position.z = goal[2]    
        pose.pose.orientation.x = goal[3]
        pose.pose.orientation.y = goal[4]
        pose.pose.orientation.z = goal[5]
        pose.pose.orientation.w = goal[6]
        pub= rospy.Publisher("/move_base_simple/goal", PoseStamped)
        pub.publish(pose)

def command(motion_direction,time):
    base_velocity = 0.1
    pub = rospy.Publisher("/cmd_vel",Twist)
    youbot_base_velocity = Twist()
    zero_vel = Twist()
    youbot_base_velocity = zero_vel
    if(motion_direction == "forward"):
        youbot_base_velocity.linear.x = base_velocity
    elif(motion_direction == "backward"):
        youbot_base_velocity.linear.x = -base_velocity
    elif(motion_direction == "right"):
        youbot_base_velocity.linear.y = -base_velocity
    elif(motion_direction == "left"):
        youbot_base_velocity.linear.y = base_velocity
    elif(motion_direction == "rotate_anticlockwise"):
        youbot_base_velocity.angular.z = base_velocity
    elif(motion_direction == "rotate_clockwise"):
        youbot_base_velocity.angular.z = -base_velocity
    elif(motion_direction == "stop"):
        youbot_base_velocity = zero_vel
    else:
        return 'failure'  
    time_taken = 0
    init_time = rospy.get_rostime().secs 
    while(init_time <= 0):
        init_time = rospy.get_rostime().secs  
    print 'init time recorded is ' + repr(init_time) +' secs'
    #timer = rospy.Timer(rospy.Duration(1), my_callback)
    while(time_taken<time):
        now = rospy.get_rostime().secs 
        time_taken =  now - init_time
        #print time_taken
        pub.publish(youbot_base_velocity)
        #rospy.sleep(0.1)
    #timer.shutdown()
    youbot_base_velocity = Twist()
    pub.publish(youbot_base_velocity)
    print 'latest time recorded is ' + repr(now) +' secs'
    print 'base command successfully published for '+ repr(time_taken) +' secs'
    return 'success'

def my_callback(event):
    print 'Timer called at '+str(event.current_real)
 

if __name__ == '__main__':
    rospy.init_node('movebase')
    # motion_direction = 'rotate_clockwise'
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
        # result = twist([0.1,0,0,0,0,0.1])
    relative([0.6,0.8,1.3,0.4,1.9,2.7,0.5])

    motion_direction = 'rotate_clockwise'
    time = 1.0
    time_taken = 0
    init_time = rospy.get_rostime().secs 
    while(init_time <= 0):
        init_time = rospy.get_rostime().secs  
    print 'init time recorded is ' + repr(init_time) +' secs'
    #timer = rospy.Timer(rospy.Duration(1), my_callback)
    while(time_taken<time):
        now = rospy.get_rostime().secs 
        time_taken =  now - init_time
        result = twist([0.1,0,0,0,0,0.1])
    '''
    to_goal('S1')
    to_goal('S2')
    to_goal('S3')
    to_goal('D1') 
    to_goal('EXIT')   



