; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude PublishGoal-request.msg.html

(cl:defclass <PublishGoal-request> (roslisp-msg-protocol:ros-message)
  ((source_frame_id
    :reader source_frame_id
    :initarg :source_frame_id
    :type cl:string
    :initform "")
   (target_frame_id
    :reader target_frame_id
    :initarg :target_frame_id
    :type cl:string
    :initform "")
   (goal_frame_id
    :reader goal_frame_id
    :initarg :goal_frame_id
    :type cl:string
    :initform "")
   (displacement
    :reader displacement
    :initarg :displacement
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass PublishGoal-request (<PublishGoal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PublishGoal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PublishGoal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<PublishGoal-request> is deprecated: use edufill_srvs-srv:PublishGoal-request instead.")))

(cl:ensure-generic-function 'source_frame_id-val :lambda-list '(m))
(cl:defmethod source_frame_id-val ((m <PublishGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:source_frame_id-val is deprecated.  Use edufill_srvs-srv:source_frame_id instead.")
  (source_frame_id m))

(cl:ensure-generic-function 'target_frame_id-val :lambda-list '(m))
(cl:defmethod target_frame_id-val ((m <PublishGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:target_frame_id-val is deprecated.  Use edufill_srvs-srv:target_frame_id instead.")
  (target_frame_id m))

(cl:ensure-generic-function 'goal_frame_id-val :lambda-list '(m))
(cl:defmethod goal_frame_id-val ((m <PublishGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:goal_frame_id-val is deprecated.  Use edufill_srvs-srv:goal_frame_id instead.")
  (goal_frame_id m))

(cl:ensure-generic-function 'displacement-val :lambda-list '(m))
(cl:defmethod displacement-val ((m <PublishGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:displacement-val is deprecated.  Use edufill_srvs-srv:displacement instead.")
  (displacement m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PublishGoal-request>) ostream)
  "Serializes a message object of type '<PublishGoal-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'source_frame_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'source_frame_id))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'target_frame_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'target_frame_id))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'goal_frame_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'goal_frame_id))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'displacement) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PublishGoal-request>) istream)
  "Deserializes a message object of type '<PublishGoal-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'source_frame_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'source_frame_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'target_frame_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'target_frame_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goal_frame_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'goal_frame_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'displacement) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PublishGoal-request>)))
  "Returns string type for a service object of type '<PublishGoal-request>"
  "edufill_srvs/PublishGoalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PublishGoal-request)))
  "Returns string type for a service object of type 'PublishGoal-request"
  "edufill_srvs/PublishGoalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PublishGoal-request>)))
  "Returns md5sum for a message object of type '<PublishGoal-request>"
  "40c3ff951d7fa57e97dd80e4753f0db5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PublishGoal-request)))
  "Returns md5sum for a message object of type 'PublishGoal-request"
  "40c3ff951d7fa57e97dd80e4753f0db5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PublishGoal-request>)))
  "Returns full string definition for message of type '<PublishGoal-request>"
  (cl:format cl:nil "string source_frame_id~%string target_frame_id~%string goal_frame_id~%geometry_msgs/Vector3 displacement~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PublishGoal-request)))
  "Returns full string definition for message of type 'PublishGoal-request"
  (cl:format cl:nil "string source_frame_id~%string target_frame_id~%string goal_frame_id~%geometry_msgs/Vector3 displacement~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PublishGoal-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'source_frame_id))
     4 (cl:length (cl:slot-value msg 'target_frame_id))
     4 (cl:length (cl:slot-value msg 'goal_frame_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'displacement))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PublishGoal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PublishGoal-request
    (cl:cons ':source_frame_id (source_frame_id msg))
    (cl:cons ':target_frame_id (target_frame_id msg))
    (cl:cons ':goal_frame_id (goal_frame_id msg))
    (cl:cons ':displacement (displacement msg))
))
;//! \htmlinclude PublishGoal-response.msg.html

(cl:defclass <PublishGoal-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass PublishGoal-response (<PublishGoal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PublishGoal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PublishGoal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<PublishGoal-response> is deprecated: use edufill_srvs-srv:PublishGoal-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PublishGoal-response>) ostream)
  "Serializes a message object of type '<PublishGoal-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PublishGoal-response>) istream)
  "Deserializes a message object of type '<PublishGoal-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PublishGoal-response>)))
  "Returns string type for a service object of type '<PublishGoal-response>"
  "edufill_srvs/PublishGoalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PublishGoal-response)))
  "Returns string type for a service object of type 'PublishGoal-response"
  "edufill_srvs/PublishGoalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PublishGoal-response>)))
  "Returns md5sum for a message object of type '<PublishGoal-response>"
  "40c3ff951d7fa57e97dd80e4753f0db5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PublishGoal-response)))
  "Returns md5sum for a message object of type 'PublishGoal-response"
  "40c3ff951d7fa57e97dd80e4753f0db5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PublishGoal-response>)))
  "Returns full string definition for message of type '<PublishGoal-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PublishGoal-response)))
  "Returns full string definition for message of type 'PublishGoal-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PublishGoal-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PublishGoal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PublishGoal-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PublishGoal)))
  'PublishGoal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PublishGoal)))
  'PublishGoal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PublishGoal)))
  "Returns string type for a service object of type '<PublishGoal>"
  "edufill_srvs/PublishGoal")