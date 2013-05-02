; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude ValidLocation-request.msg.html

(cl:defclass <ValidLocation-request> (roslisp-msg-protocol:ros-message)
  ((robot_pose
    :reader robot_pose
    :initarg :robot_pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass ValidLocation-request (<ValidLocation-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ValidLocation-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ValidLocation-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<ValidLocation-request> is deprecated: use edufill_srvs-srv:ValidLocation-request instead.")))

(cl:ensure-generic-function 'robot_pose-val :lambda-list '(m))
(cl:defmethod robot_pose-val ((m <ValidLocation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:robot_pose-val is deprecated.  Use edufill_srvs-srv:robot_pose instead.")
  (robot_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ValidLocation-request>) ostream)
  "Serializes a message object of type '<ValidLocation-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'robot_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ValidLocation-request>) istream)
  "Deserializes a message object of type '<ValidLocation-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'robot_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ValidLocation-request>)))
  "Returns string type for a service object of type '<ValidLocation-request>"
  "edufill_srvs/ValidLocationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ValidLocation-request)))
  "Returns string type for a service object of type 'ValidLocation-request"
  "edufill_srvs/ValidLocationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ValidLocation-request>)))
  "Returns md5sum for a message object of type '<ValidLocation-request>"
  "76b2102915934036b1cec4698536f539")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ValidLocation-request)))
  "Returns md5sum for a message object of type 'ValidLocation-request"
  "76b2102915934036b1cec4698536f539")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ValidLocation-request>)))
  "Returns full string definition for message of type '<ValidLocation-request>"
  (cl:format cl:nil "geometry_msgs/PoseStamped robot_pose~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ValidLocation-request)))
  "Returns full string definition for message of type 'ValidLocation-request"
  (cl:format cl:nil "geometry_msgs/PoseStamped robot_pose~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ValidLocation-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'robot_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ValidLocation-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ValidLocation-request
    (cl:cons ':robot_pose (robot_pose msg))
))
;//! \htmlinclude ValidLocation-response.msg.html

(cl:defclass <ValidLocation-response> (roslisp-msg-protocol:ros-message)
  ((costmap_value
    :reader costmap_value
    :initarg :costmap_value
    :type cl:string
    :initform ""))
)

(cl:defclass ValidLocation-response (<ValidLocation-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ValidLocation-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ValidLocation-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<ValidLocation-response> is deprecated: use edufill_srvs-srv:ValidLocation-response instead.")))

(cl:ensure-generic-function 'costmap_value-val :lambda-list '(m))
(cl:defmethod costmap_value-val ((m <ValidLocation-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:costmap_value-val is deprecated.  Use edufill_srvs-srv:costmap_value instead.")
  (costmap_value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ValidLocation-response>) ostream)
  "Serializes a message object of type '<ValidLocation-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'costmap_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'costmap_value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ValidLocation-response>) istream)
  "Deserializes a message object of type '<ValidLocation-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'costmap_value) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'costmap_value) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ValidLocation-response>)))
  "Returns string type for a service object of type '<ValidLocation-response>"
  "edufill_srvs/ValidLocationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ValidLocation-response)))
  "Returns string type for a service object of type 'ValidLocation-response"
  "edufill_srvs/ValidLocationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ValidLocation-response>)))
  "Returns md5sum for a message object of type '<ValidLocation-response>"
  "76b2102915934036b1cec4698536f539")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ValidLocation-response)))
  "Returns md5sum for a message object of type 'ValidLocation-response"
  "76b2102915934036b1cec4698536f539")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ValidLocation-response>)))
  "Returns full string definition for message of type '<ValidLocation-response>"
  (cl:format cl:nil "string costmap_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ValidLocation-response)))
  "Returns full string definition for message of type 'ValidLocation-response"
  (cl:format cl:nil "string costmap_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ValidLocation-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'costmap_value))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ValidLocation-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ValidLocation-response
    (cl:cons ':costmap_value (costmap_value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ValidLocation)))
  'ValidLocation-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ValidLocation)))
  'ValidLocation-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ValidLocation)))
  "Returns string type for a service object of type '<ValidLocation>"
  "edufill_srvs/ValidLocation")