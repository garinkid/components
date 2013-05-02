; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude SetPoseStamped-request.msg.html

(cl:defclass <SetPoseStamped-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass SetPoseStamped-request (<SetPoseStamped-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPoseStamped-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPoseStamped-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<SetPoseStamped-request> is deprecated: use edufill_srvs-srv:SetPoseStamped-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <SetPoseStamped-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:pose-val is deprecated.  Use edufill_srvs-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPoseStamped-request>) ostream)
  "Serializes a message object of type '<SetPoseStamped-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPoseStamped-request>) istream)
  "Deserializes a message object of type '<SetPoseStamped-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPoseStamped-request>)))
  "Returns string type for a service object of type '<SetPoseStamped-request>"
  "edufill_srvs/SetPoseStampedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPoseStamped-request)))
  "Returns string type for a service object of type 'SetPoseStamped-request"
  "edufill_srvs/SetPoseStampedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPoseStamped-request>)))
  "Returns md5sum for a message object of type '<SetPoseStamped-request>"
  "3f8930d968a3e84d471dff917bb1cdae")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPoseStamped-request)))
  "Returns md5sum for a message object of type 'SetPoseStamped-request"
  "3f8930d968a3e84d471dff917bb1cdae")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPoseStamped-request>)))
  "Returns full string definition for message of type '<SetPoseStamped-request>"
  (cl:format cl:nil "geometry_msgs/PoseStamped pose~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPoseStamped-request)))
  "Returns full string definition for message of type 'SetPoseStamped-request"
  (cl:format cl:nil "geometry_msgs/PoseStamped pose~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPoseStamped-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPoseStamped-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPoseStamped-request
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude SetPoseStamped-response.msg.html

(cl:defclass <SetPoseStamped-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetPoseStamped-response (<SetPoseStamped-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPoseStamped-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPoseStamped-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<SetPoseStamped-response> is deprecated: use edufill_srvs-srv:SetPoseStamped-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPoseStamped-response>) ostream)
  "Serializes a message object of type '<SetPoseStamped-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPoseStamped-response>) istream)
  "Deserializes a message object of type '<SetPoseStamped-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPoseStamped-response>)))
  "Returns string type for a service object of type '<SetPoseStamped-response>"
  "edufill_srvs/SetPoseStampedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPoseStamped-response)))
  "Returns string type for a service object of type 'SetPoseStamped-response"
  "edufill_srvs/SetPoseStampedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPoseStamped-response>)))
  "Returns md5sum for a message object of type '<SetPoseStamped-response>"
  "3f8930d968a3e84d471dff917bb1cdae")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPoseStamped-response)))
  "Returns md5sum for a message object of type 'SetPoseStamped-response"
  "3f8930d968a3e84d471dff917bb1cdae")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPoseStamped-response>)))
  "Returns full string definition for message of type '<SetPoseStamped-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPoseStamped-response)))
  "Returns full string definition for message of type 'SetPoseStamped-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPoseStamped-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPoseStamped-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPoseStamped-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetPoseStamped)))
  'SetPoseStamped-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetPoseStamped)))
  'SetPoseStamped-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPoseStamped)))
  "Returns string type for a service object of type '<SetPoseStamped>"
  "edufill_srvs/SetPoseStamped")