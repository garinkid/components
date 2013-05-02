; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude GetPoseStamped-request.msg.html

(cl:defclass <GetPoseStamped-request> (roslisp-msg-protocol:ros-message)
  ((object_pose
    :reader object_pose
    :initarg :object_pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass GetPoseStamped-request (<GetPoseStamped-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetPoseStamped-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetPoseStamped-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<GetPoseStamped-request> is deprecated: use edufill_srvs-srv:GetPoseStamped-request instead.")))

(cl:ensure-generic-function 'object_pose-val :lambda-list '(m))
(cl:defmethod object_pose-val ((m <GetPoseStamped-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:object_pose-val is deprecated.  Use edufill_srvs-srv:object_pose instead.")
  (object_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetPoseStamped-request>) ostream)
  "Serializes a message object of type '<GetPoseStamped-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'object_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetPoseStamped-request>) istream)
  "Deserializes a message object of type '<GetPoseStamped-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'object_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetPoseStamped-request>)))
  "Returns string type for a service object of type '<GetPoseStamped-request>"
  "edufill_srvs/GetPoseStampedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPoseStamped-request)))
  "Returns string type for a service object of type 'GetPoseStamped-request"
  "edufill_srvs/GetPoseStampedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetPoseStamped-request>)))
  "Returns md5sum for a message object of type '<GetPoseStamped-request>"
  "8e651cf3b86cbaea8426e21138585b36")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetPoseStamped-request)))
  "Returns md5sum for a message object of type 'GetPoseStamped-request"
  "8e651cf3b86cbaea8426e21138585b36")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetPoseStamped-request>)))
  "Returns full string definition for message of type '<GetPoseStamped-request>"
  (cl:format cl:nil "geometry_msgs/PoseStamped object_pose~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetPoseStamped-request)))
  "Returns full string definition for message of type 'GetPoseStamped-request"
  (cl:format cl:nil "geometry_msgs/PoseStamped object_pose~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetPoseStamped-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'object_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetPoseStamped-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetPoseStamped-request
    (cl:cons ':object_pose (object_pose msg))
))
;//! \htmlinclude GetPoseStamped-response.msg.html

(cl:defclass <GetPoseStamped-response> (roslisp-msg-protocol:ros-message)
  ((base_pose
    :reader base_pose
    :initarg :base_pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass GetPoseStamped-response (<GetPoseStamped-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetPoseStamped-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetPoseStamped-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<GetPoseStamped-response> is deprecated: use edufill_srvs-srv:GetPoseStamped-response instead.")))

(cl:ensure-generic-function 'base_pose-val :lambda-list '(m))
(cl:defmethod base_pose-val ((m <GetPoseStamped-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:base_pose-val is deprecated.  Use edufill_srvs-srv:base_pose instead.")
  (base_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetPoseStamped-response>) ostream)
  "Serializes a message object of type '<GetPoseStamped-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'base_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetPoseStamped-response>) istream)
  "Deserializes a message object of type '<GetPoseStamped-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'base_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetPoseStamped-response>)))
  "Returns string type for a service object of type '<GetPoseStamped-response>"
  "edufill_srvs/GetPoseStampedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPoseStamped-response)))
  "Returns string type for a service object of type 'GetPoseStamped-response"
  "edufill_srvs/GetPoseStampedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetPoseStamped-response>)))
  "Returns md5sum for a message object of type '<GetPoseStamped-response>"
  "8e651cf3b86cbaea8426e21138585b36")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetPoseStamped-response)))
  "Returns md5sum for a message object of type 'GetPoseStamped-response"
  "8e651cf3b86cbaea8426e21138585b36")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetPoseStamped-response>)))
  "Returns full string definition for message of type '<GetPoseStamped-response>"
  (cl:format cl:nil "geometry_msgs/PoseStamped base_pose~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetPoseStamped-response)))
  "Returns full string definition for message of type 'GetPoseStamped-response"
  (cl:format cl:nil "geometry_msgs/PoseStamped base_pose~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetPoseStamped-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'base_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetPoseStamped-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetPoseStamped-response
    (cl:cons ':base_pose (base_pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetPoseStamped)))
  'GetPoseStamped-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetPoseStamped)))
  'GetPoseStamped-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPoseStamped)))
  "Returns string type for a service object of type '<GetPoseStamped>"
  "edufill_srvs/GetPoseStamped")