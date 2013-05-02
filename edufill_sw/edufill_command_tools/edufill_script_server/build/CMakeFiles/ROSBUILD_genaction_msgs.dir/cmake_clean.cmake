FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/edufill_script_server/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genaction_msgs"
  "../msg/ScriptAction.msg"
  "../msg/ScriptGoal.msg"
  "../msg/ScriptActionGoal.msg"
  "../msg/ScriptResult.msg"
  "../msg/ScriptActionResult.msg"
  "../msg/ScriptFeedback.msg"
  "../msg/ScriptActionFeedback.msg"
  "../msg/StateAction.msg"
  "../msg/StateGoal.msg"
  "../msg/StateActionGoal.msg"
  "../msg/StateResult.msg"
  "../msg/StateActionResult.msg"
  "../msg/StateFeedback.msg"
  "../msg/StateActionFeedback.msg"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genaction_msgs.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
