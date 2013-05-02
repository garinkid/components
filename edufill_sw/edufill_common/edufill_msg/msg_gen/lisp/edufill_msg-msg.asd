
(cl:in-package :asdf)

(defsystem "edufill_msg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "MoveToCartesianPoseGoal" :depends-on ("_package_MoveToCartesianPoseGoal"))
    (:file "_package_MoveToCartesianPoseGoal" :depends-on ("_package"))
  ))