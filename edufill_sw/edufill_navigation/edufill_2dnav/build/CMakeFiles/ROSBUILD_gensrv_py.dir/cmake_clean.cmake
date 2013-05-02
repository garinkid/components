FILE(REMOVE_RECURSE
  "../srv_gen"
  "../src/edufill_2dnav/srv"
  "../srv_gen"
  "CMakeFiles/ROSBUILD_gensrv_py"
  "../src/edufill_2dnav/srv/__init__.py"
  "../src/edufill_2dnav/srv/_GoalCheck.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gensrv_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
