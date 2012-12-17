#!/usr/bin/env python

import roslib; roslib.load_manifest("edufill_blockly")
import rospy
import arm_kinematics  #/edufill_manipulation/edufill_arm_cmds/src/arm_kinematics.py


if __name__=="__main__":
    rospy.init_node('edufill_blockly_node')
    time.sleep(0.5)
    ks = KinematicsSolver() # generated once for checker and solution block
    # constraint aware kinematics 
    xyzrpy = [0.024 + 0.033,0,0.535,0,0,0];
    iksolver_state = ks.check_ik_solver_has_solution(xyzrpy,"/base_link") # generated code for checker block
	ik_solution = ks.get_ik_solution(xyzrpy,"/base_link") # generated code for solution block
	cartesian_pose = ks.get_fk_solution(ik_solution) # additional block to be generated for fk


    # proposed ik block for high level
    # start of code
    iksolver_state = ks.check_ik_solver_has_solution(xyzrpy,"/base_link") 
	if (iksolver_state):
		ik_solution = ks.get_ik_solution(xyzrpy,"/base_link") 
		print ik_solution
	else:
		print("IK solver didn't find a solution")
    # end of code
