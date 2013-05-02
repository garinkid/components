
(cl:in-package :asdf)

(defsystem "edufill_object_detection-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "DetectCube" :depends-on ("_package_DetectCube"))
    (:file "_package_DetectCube" :depends-on ("_package"))
  ))