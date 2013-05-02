FILE(REMOVE_RECURSE
  "../srv_gen"
  "../src/edufill_srvs/srv"
  "../srv_gen"
  "CMakeFiles/ROSBUILD_gensrv_cpp"
  "../srv_gen/cpp/include/edufill_srvs/GetPoseStamped.h"
  "../srv_gen/cpp/include/edufill_srvs/ReadLaserScan.h"
  "../srv_gen/cpp/include/edufill_srvs/ComputeIK.h"
  "../srv_gen/cpp/include/edufill_srvs/SetPoseStamped.h"
  "../srv_gen/cpp/include/edufill_srvs/SetVelocity.h"
  "../srv_gen/cpp/include/edufill_srvs/ReturnBool.h"
  "../srv_gen/cpp/include/edufill_srvs/ValidLocation.h"
  "../srv_gen/cpp/include/edufill_srvs/SetMapAction.h"
  "../srv_gen/cpp/include/edufill_srvs/ReadJointPositions.h"
  "../srv_gen/cpp/include/edufill_srvs/ReadOdom.h"
  "../srv_gen/cpp/include/edufill_srvs/MotionCommand.h"
  "../srv_gen/cpp/include/edufill_srvs/RecognizeObject.h"
  "../srv_gen/cpp/include/edufill_srvs/SetMarkerFrame.h"
  "../srv_gen/cpp/include/edufill_srvs/PublishGoal.h"
  "../srv_gen/cpp/include/edufill_srvs/GetDominantPlane.h"
  "../srv_gen/cpp/include/edufill_srvs/ExtractPlanes.h"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gensrv_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
