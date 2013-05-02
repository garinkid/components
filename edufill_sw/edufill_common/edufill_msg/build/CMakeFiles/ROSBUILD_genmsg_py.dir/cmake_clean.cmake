FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/edufill_msg/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/edufill_msg/msg/__init__.py"
  "../src/edufill_msg/msg/_MoveToCartesianPoseGoal.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
