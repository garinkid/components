FILE(REMOVE_RECURSE
  "../srv_gen"
  "../src/edufill_srvs/srv"
  "../srv_gen"
  "CMakeFiles/ROSBUILD_gensrv_py"
  "../src/edufill_srvs/srv/__init__.py"
  "../src/edufill_srvs/srv/_GetPoseStamped.py"
  "../src/edufill_srvs/srv/_ReadLaserScan.py"
  "../src/edufill_srvs/srv/_ComputeIK.py"
  "../src/edufill_srvs/srv/_SetPoseStamped.py"
  "../src/edufill_srvs/srv/_SetVelocity.py"
  "../src/edufill_srvs/srv/_ReturnBool.py"
  "../src/edufill_srvs/srv/_ValidLocation.py"
  "../src/edufill_srvs/srv/_SetMapAction.py"
  "../src/edufill_srvs/srv/_ReadJointPositions.py"
  "../src/edufill_srvs/srv/_ReadOdom.py"
  "../src/edufill_srvs/srv/_MotionCommand.py"
  "../src/edufill_srvs/srv/_RecognizeObject.py"
  "../src/edufill_srvs/srv/_SetMarkerFrame.py"
  "../src/edufill_srvs/srv/_PublishGoal.py"
  "../src/edufill_srvs/srv/_GetDominantPlane.py"
  "../src/edufill_srvs/srv/_ExtractPlanes.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gensrv_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
