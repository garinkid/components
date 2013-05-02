; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude ReadOdom-request.msg.html

(cl:defclass <ReadOdom-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ReadOdom-request (<ReadOdom-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadOdom-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadOdom-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<ReadOdom-request> is deprecated: use edufill_srvs-srv:ReadOdom-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadOdom-request>) ostream)
  "Serializes a message object of type '<ReadOdom-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadOdom-request>) istream)
  "Deserializes a message object of type '<ReadOdom-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadOdom-request>)))
  "Returns string type for a service object of type '<ReadOdom-request>"
  "edufill_srvs/ReadOdomRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadOdom-request)))
  "Returns string type for a service object of type 'ReadOdom-request"
  "edufill_srvs/ReadOdomRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadOdom-request>)))
  "Returns md5sum for a message object of type '<ReadOdom-request>"
  "71a343bbd4c382fbda6afdcf1976f7b2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadOdom-request)))
  "Returns md5sum for a message object of type 'ReadOdom-request"
  "71a343bbd4c382fbda6afdcf1976f7b2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadOdom-request>)))
  "Returns full string definition for message of type '<ReadOdom-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadOdom-request)))
  "Returns full string definition for message of type 'ReadOdom-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadOdom-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadOdom-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadOdom-request
))
;//! \htmlinclude ReadOdom-response.msg.html

(cl:defclass <ReadOdom-response> (roslisp-msg-protocol:ros-message)
  ((odom_data
    :reader odom_data
    :initarg :odom_data
    :type nav_msgs-msg:Odometry
    :initform (cl:make-instance 'nav_msgs-msg:Odometry)))
)

(cl:defclass ReadOdom-response (<ReadOdom-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadOdom-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadOdom-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<ReadOdom-response> is deprecated: use edufill_srvs-srv:ReadOdom-response instead.")))

(cl:ensure-generic-function 'odom_data-val :lambda-list '(m))
(cl:defmethod odom_data-val ((m <ReadOdom-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:odom_data-val is deprecated.  Use edufill_srvs-srv:odom_data instead.")
  (odom_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadOdom-response>) ostream)
  "Serializes a message object of type '<ReadOdom-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'odom_data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadOdom-response>) istream)
  "Deserializes a message object of type '<ReadOdom-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'odom_data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadOdom-response>)))
  "Returns string type for a service object of type '<ReadOdom-response>"
  "edufill_srvs/ReadOdomResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadOdom-response)))
  "Returns string type for a service object of type 'ReadOdom-response"
  "edufill_srvs/ReadOdomResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadOdom-response>)))
  "Returns md5sum for a message object of type '<ReadOdom-response>"
  "71a343bbd4c382fbda6afdcf1976f7b2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadOdom-response)))
  "Returns md5sum for a message object of type 'ReadOdom-response"
  "71a343bbd4c382fbda6afdcf1976f7b2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadOdom-response>)))
  "Returns full string definition for message of type '<ReadOdom-response>"
  (cl:format cl:nil "nav_msgs/Odometry odom_data~%~%~%================================================================================~%MSG: nav_msgs/Odometry~%# This represents an estimate of a position and velocity in free space.  ~%# The pose in this message should be specified in the coordinate frame given by header.frame_id.~%# The twist in this message should be specified in the coordinate frame given by the child_frame_id~%Header header~%string child_frame_id~%geometry_msgs/PoseWithCovariance pose~%geometry_msgs/TwistWithCovariance twist~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertianty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into it's linear and angular parts. ~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadOdom-response)))
  "Returns full string definition for message of type 'ReadOdom-response"
  (cl:format cl:nil "nav_msgs/Odometry odom_data~%~%~%================================================================================~%MSG: nav_msgs/Odometry~%# This represents an estimate of a position and velocity in free space.  ~%# The pose in this message should be specified in the coordinate frame given by header.frame_id.~%# The twist in this message should be specified in the coordinate frame given by the child_frame_id~%Header header~%string child_frame_id~%geometry_msgs/PoseWithCovariance pose~%geometry_msgs/TwistWithCovariance twist~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertianty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into it's linear and angular parts. ~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadOdom-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'odom_data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadOdom-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadOdom-response
    (cl:cons ':odom_data (odom_data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ReadOdom)))
  'ReadOdom-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ReadOdom)))
  'ReadOdom-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadOdom)))
  "Returns string type for a service object of type '<ReadOdom>"
  "edufill_srvs/ReadOdom")