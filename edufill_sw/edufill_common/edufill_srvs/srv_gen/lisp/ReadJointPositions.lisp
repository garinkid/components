; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude ReadJointPositions-request.msg.html

(cl:defclass <ReadJointPositions-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ReadJointPositions-request (<ReadJointPositions-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadJointPositions-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadJointPositions-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<ReadJointPositions-request> is deprecated: use edufill_srvs-srv:ReadJointPositions-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadJointPositions-request>) ostream)
  "Serializes a message object of type '<ReadJointPositions-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadJointPositions-request>) istream)
  "Deserializes a message object of type '<ReadJointPositions-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadJointPositions-request>)))
  "Returns string type for a service object of type '<ReadJointPositions-request>"
  "edufill_srvs/ReadJointPositionsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadJointPositions-request)))
  "Returns string type for a service object of type 'ReadJointPositions-request"
  "edufill_srvs/ReadJointPositionsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadJointPositions-request>)))
  "Returns md5sum for a message object of type '<ReadJointPositions-request>"
  "a286ff40b196573b9ebf3999a2f8d438")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadJointPositions-request)))
  "Returns md5sum for a message object of type 'ReadJointPositions-request"
  "a286ff40b196573b9ebf3999a2f8d438")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadJointPositions-request>)))
  "Returns full string definition for message of type '<ReadJointPositions-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadJointPositions-request)))
  "Returns full string definition for message of type 'ReadJointPositions-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadJointPositions-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadJointPositions-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadJointPositions-request
))
;//! \htmlinclude ReadJointPositions-response.msg.html

(cl:defclass <ReadJointPositions-response> (roslisp-msg-protocol:ros-message)
  ((joint_positions
    :reader joint_positions
    :initarg :joint_positions
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ReadJointPositions-response (<ReadJointPositions-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadJointPositions-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadJointPositions-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<ReadJointPositions-response> is deprecated: use edufill_srvs-srv:ReadJointPositions-response instead.")))

(cl:ensure-generic-function 'joint_positions-val :lambda-list '(m))
(cl:defmethod joint_positions-val ((m <ReadJointPositions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:joint_positions-val is deprecated.  Use edufill_srvs-srv:joint_positions instead.")
  (joint_positions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadJointPositions-response>) ostream)
  "Serializes a message object of type '<ReadJointPositions-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_positions))))
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
   (cl:slot-value msg 'joint_positions))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadJointPositions-response>) istream)
  "Deserializes a message object of type '<ReadJointPositions-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_positions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_positions)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadJointPositions-response>)))
  "Returns string type for a service object of type '<ReadJointPositions-response>"
  "edufill_srvs/ReadJointPositionsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadJointPositions-response)))
  "Returns string type for a service object of type 'ReadJointPositions-response"
  "edufill_srvs/ReadJointPositionsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadJointPositions-response>)))
  "Returns md5sum for a message object of type '<ReadJointPositions-response>"
  "a286ff40b196573b9ebf3999a2f8d438")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadJointPositions-response)))
  "Returns md5sum for a message object of type 'ReadJointPositions-response"
  "a286ff40b196573b9ebf3999a2f8d438")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadJointPositions-response>)))
  "Returns full string definition for message of type '<ReadJointPositions-response>"
  (cl:format cl:nil "float64[] joint_positions~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadJointPositions-response)))
  "Returns full string definition for message of type 'ReadJointPositions-response"
  (cl:format cl:nil "float64[] joint_positions~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadJointPositions-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadJointPositions-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadJointPositions-response
    (cl:cons ':joint_positions (joint_positions msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ReadJointPositions)))
  'ReadJointPositions-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ReadJointPositions)))
  'ReadJointPositions-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadJointPositions)))
  "Returns string type for a service object of type '<ReadJointPositions>"
  "edufill_srvs/ReadJointPositions")