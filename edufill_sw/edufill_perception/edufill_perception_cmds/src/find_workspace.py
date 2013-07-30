#!/usr/bin/python
import roslib; roslib.load_manifest('edufill_perception_cmds')
import rospy
import std_srvs.srv
import edufill_srvs.srv
import hbrs_srvs.srv

# Move arm to a cartesian position
def find_workspace_cmd():
    plane_extractor_srv = rospy.ServiceProxy('/find_workspace',edufill_srvs.srv.FindWorkspace)    
    rospy.wait_for_service('/extract_planes', 30)

    rospy.sleep(3)

    for i in range(20): 
        print "find object try: ", i
        resp = plane_extractor_srv()
          
        if (len(resp.planarpolygons) <= 0):
            rospy.loginfo('found no planes')
            rospy.sleep(0.1);
        else:    
            rospy.loginfo('found {0} planes'.format(len(resp.planarpolygons)))
            break
        
    if (len(resp.planarpolygons) <= 0):
        rospy.logerr("no planes found");
        plane_list = []            
        return 'failed'   
    else:
        for obj in resp.objects:
            if obj.pose.pose.position.z <=0.5 and obj.pose.pose.position.z >=30:
                continue

            workspace = obj

            return workspace



if __name__ == '__main__':
    rospy.init_node('find_workspace')
    workspace = find_worspace()
    print workspace


