; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude ComputeIK-request.msg.html

(cl:defclass <ComputeIK-request> (roslisp-msg-protocol:ros-message)
  ((tool_pose
    :reader tool_pose
    :initarg :tool_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass ComputeIK-request (<ComputeIK-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ComputeIK-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ComputeIK-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<ComputeIK-request> is deprecated: use edufill_srvs-srv:ComputeIK-request instead.")))

(cl:ensure-generic-function 'tool_pose-val :lambda-list '(m))
(cl:defmethod tool_pose-val ((m <ComputeIK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:tool_pose-val is deprecated.  Use edufill_srvs-srv:tool_pose instead.")
  (tool_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ComputeIK-request>) ostream)
  "Serializes a message object of type '<ComputeIK-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'tool_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ComputeIK-request>) istream)
  "Deserializes a message object of type '<ComputeIK-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'tool_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ComputeIK-request>)))
  "Returns string type for a service object of type '<ComputeIK-request>"
  "edufill_srvs/ComputeIKRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ComputeIK-request)))
  "Returns string type for a service object of type 'ComputeIK-request"
  "edufill_srvs/ComputeIKRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ComputeIK-request>)))
  "Returns md5sum for a message object of type '<ComputeIK-request>"
  "86d0d24d94df9b7609cf61ef59fb23e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ComputeIK-request)))
  "Returns md5sum for a message object of type 'ComputeIK-request"
  "86d0d24d94df9b7609cf61ef59fb23e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ComputeIK-request>)))
  "Returns full string definition for message of type '<ComputeIK-request>"
  (cl:format cl:nil "geometry_msgs/Pose tool_pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ComputeIK-request)))
  "Returns full string definition for message of type 'ComputeIK-request"
  (cl:format cl:nil "geometry_msgs/Pose tool_pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ComputeIK-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'tool_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ComputeIK-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ComputeIK-request
    (cl:cons ':tool_pose (tool_pose msg))
))
;//! \htmlinclude ComputeIK-response.msg.html

(cl:defclass <ComputeIK-response> (roslisp-msg-protocol:ros-message)
  ((joint_values
    :reader joint_values
    :initarg :joint_values
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ComputeIK-response (<ComputeIK-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ComputeIK-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ComputeIK-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<ComputeIK-response> is deprecated: use edufill_srvs-srv:ComputeIK-response instead.")))

(cl:ensure-generic-function 'joint_values-val :lambda-list '(m))
(cl:defmethod joint_values-val ((m <ComputeIK-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:joint_values-val is deprecated.  Use edufill_srvs-srv:joint_values instead.")
  (joint_values m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ComputeIK-response>) ostream)
  "Serializes a message object of type '<ComputeIK-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_values))))
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
   (cl:slot-value msg 'joint_values))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ComputeIK-response>) istream)
  "Deserializes a message object of type '<ComputeIK-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_values) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_values)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ComputeIK-response>)))
  "Returns string type for a service object of type '<ComputeIK-response>"
  "edufill_srvs/ComputeIKResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ComputeIK-response)))
  "Returns string type for a service object of type 'ComputeIK-response"
  "edufill_srvs/ComputeIKResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ComputeIK-response>)))
  "Returns md5sum for a message object of type '<ComputeIK-response>"
  "86d0d24d94df9b7609cf61ef59fb23e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ComputeIK-response)))
  "Returns md5sum for a message object of type 'ComputeIK-response"
  "86d0d24d94df9b7609cf61ef59fb23e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ComputeIK-response>)))
  "Returns full string definition for message of type '<ComputeIK-response>"
  (cl:format cl:nil "float64[] joint_values~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ComputeIK-response)))
  "Returns full string definition for message of type 'ComputeIK-response"
  (cl:format cl:nil "float64[] joint_values~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ComputeIK-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_values) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ComputeIK-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ComputeIK-response
    (cl:cons ':joint_values (joint_values msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ComputeIK)))
  'ComputeIK-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ComputeIK)))
  'ComputeIK-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ComputeIK)))
  "Returns string type for a service object of type '<ComputeIK>"
  "edufill_srvs/ComputeIK")