; Auto-generated. Do not edit!


(cl:in-package edufill_msg-msg)


;//! \htmlinclude MoveToCartesianPoseGoal.msg.html

(cl:defclass <MoveToCartesianPoseGoal> (roslisp-msg-protocol:ros-message)
  ((goal
    :reader goal
    :initarg :goal
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (cartesian_stiffness
    :reader cartesian_stiffness
    :initarg :cartesian_stiffness
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (cartesian_damping
    :reader cartesian_damping
    :initarg :cartesian_damping
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass MoveToCartesianPoseGoal (<MoveToCartesianPoseGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToCartesianPoseGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToCartesianPoseGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_msg-msg:<MoveToCartesianPoseGoal> is deprecated: use edufill_msg-msg:MoveToCartesianPoseGoal instead.")))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <MoveToCartesianPoseGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_msg-msg:goal-val is deprecated.  Use edufill_msg-msg:goal instead.")
  (goal m))

(cl:ensure-generic-function 'cartesian_stiffness-val :lambda-list '(m))
(cl:defmethod cartesian_stiffness-val ((m <MoveToCartesianPoseGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_msg-msg:cartesian_stiffness-val is deprecated.  Use edufill_msg-msg:cartesian_stiffness instead.")
  (cartesian_stiffness m))

(cl:ensure-generic-function 'cartesian_damping-val :lambda-list '(m))
(cl:defmethod cartesian_damping-val ((m <MoveToCartesianPoseGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_msg-msg:cartesian_damping-val is deprecated.  Use edufill_msg-msg:cartesian_damping instead.")
  (cartesian_damping m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToCartesianPoseGoal>) ostream)
  "Serializes a message object of type '<MoveToCartesianPoseGoal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'cartesian_stiffness))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'cartesian_stiffness))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'cartesian_damping))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'cartesian_damping))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToCartesianPoseGoal>) istream)
  "Deserializes a message object of type '<MoveToCartesianPoseGoal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cartesian_stiffness) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'cartesian_stiffness)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cartesian_damping) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'cartesian_damping)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToCartesianPoseGoal>)))
  "Returns string type for a message object of type '<MoveToCartesianPoseGoal>"
  "edufill_msg/MoveToCartesianPoseGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToCartesianPoseGoal)))
  "Returns string type for a message object of type 'MoveToCartesianPoseGoal"
  "edufill_msg/MoveToCartesianPoseGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToCartesianPoseGoal>)))
  "Returns md5sum for a message object of type '<MoveToCartesianPoseGoal>"
  "f604333b1c42a458d8e70c980fbc1eda")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToCartesianPoseGoal)))
  "Returns md5sum for a message object of type 'MoveToCartesianPoseGoal"
  "f604333b1c42a458d8e70c980fbc1eda")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToCartesianPoseGoal>)))
  "Returns full string definition for message of type '<MoveToCartesianPoseGoal>"
  (cl:format cl:nil "geometry_msgs/PoseStamped goal~%float64[] cartesian_stiffness~%float64[] cartesian_damping~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToCartesianPoseGoal)))
  "Returns full string definition for message of type 'MoveToCartesianPoseGoal"
  (cl:format cl:nil "geometry_msgs/PoseStamped goal~%float64[] cartesian_stiffness~%float64[] cartesian_damping~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToCartesianPoseGoal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'cartesian_stiffness) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'cartesian_damping) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToCartesianPoseGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToCartesianPoseGoal
    (cl:cons ':goal (goal msg))
    (cl:cons ':cartesian_stiffness (cartesian_stiffness msg))
    (cl:cons ':cartesian_damping (cartesian_damping msg))
))
