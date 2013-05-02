
(cl:in-package :asdf)

(defsystem "edufill_2dnav-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "GoalCheck" :depends-on ("_package_GoalCheck"))
    (:file "_package_GoalCheck" :depends-on ("_package"))
  ))