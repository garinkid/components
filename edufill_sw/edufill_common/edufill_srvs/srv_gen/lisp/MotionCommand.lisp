; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude MotionCommand-request.msg.html

(cl:defclass <MotionCommand-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform ""))
)

(cl:defclass MotionCommand-request (<MotionCommand-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotionCommand-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotionCommand-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<MotionCommand-request> is deprecated: use edufill_srvs-srv:MotionCommand-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <MotionCommand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:command-val is deprecated.  Use edufill_srvs-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotionCommand-request>) ostream)
  "Serializes a message object of type '<MotionCommand-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotionCommand-request>) istream)
  "Deserializes a message object of type '<MotionCommand-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotionCommand-request>)))
  "Returns string type for a service object of type '<MotionCommand-request>"
  "edufill_srvs/MotionCommandRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotionCommand-request)))
  "Returns string type for a service object of type 'MotionCommand-request"
  "edufill_srvs/MotionCommandRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotionCommand-request>)))
  "Returns md5sum for a message object of type '<MotionCommand-request>"
  "cba5e21e920a3a2b7b375cb65b64cdea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotionCommand-request)))
  "Returns md5sum for a message object of type 'MotionCommand-request"
  "cba5e21e920a3a2b7b375cb65b64cdea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotionCommand-request>)))
  "Returns full string definition for message of type '<MotionCommand-request>"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotionCommand-request)))
  "Returns full string definition for message of type 'MotionCommand-request"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotionCommand-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotionCommand-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MotionCommand-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude MotionCommand-response.msg.html

(cl:defclass <MotionCommand-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass MotionCommand-response (<MotionCommand-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotionCommand-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotionCommand-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<MotionCommand-response> is deprecated: use edufill_srvs-srv:MotionCommand-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotionCommand-response>) ostream)
  "Serializes a message object of type '<MotionCommand-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotionCommand-response>) istream)
  "Deserializes a message object of type '<MotionCommand-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotionCommand-response>)))
  "Returns string type for a service object of type '<MotionCommand-response>"
  "edufill_srvs/MotionCommandResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotionCommand-response)))
  "Returns string type for a service object of type 'MotionCommand-response"
  "edufill_srvs/MotionCommandResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotionCommand-response>)))
  "Returns md5sum for a message object of type '<MotionCommand-response>"
  "cba5e21e920a3a2b7b375cb65b64cdea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotionCommand-response)))
  "Returns md5sum for a message object of type 'MotionCommand-response"
  "cba5e21e920a3a2b7b375cb65b64cdea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotionCommand-response>)))
  "Returns full string definition for message of type '<MotionCommand-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotionCommand-response)))
  "Returns full string definition for message of type 'MotionCommand-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotionCommand-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotionCommand-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MotionCommand-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MotionCommand)))
  'MotionCommand-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MotionCommand)))
  'MotionCommand-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotionCommand)))
  "Returns string type for a service object of type '<MotionCommand>"
  "edufill_srvs/MotionCommand")