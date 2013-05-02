; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude SetMapAction-request.msg.html

(cl:defclass <SetMapAction-request> (roslisp-msg-protocol:ros-message)
  ((action
    :reader action
    :initarg :action
    :type cl:string
    :initform "")
   (file_name
    :reader file_name
    :initarg :file_name
    :type cl:string
    :initform ""))
)

(cl:defclass SetMapAction-request (<SetMapAction-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetMapAction-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetMapAction-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<SetMapAction-request> is deprecated: use edufill_srvs-srv:SetMapAction-request instead.")))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <SetMapAction-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:action-val is deprecated.  Use edufill_srvs-srv:action instead.")
  (action m))

(cl:ensure-generic-function 'file_name-val :lambda-list '(m))
(cl:defmethod file_name-val ((m <SetMapAction-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:file_name-val is deprecated.  Use edufill_srvs-srv:file_name instead.")
  (file_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetMapAction-request>) ostream)
  "Serializes a message object of type '<SetMapAction-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'file_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'file_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetMapAction-request>) istream)
  "Deserializes a message object of type '<SetMapAction-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'file_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'file_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetMapAction-request>)))
  "Returns string type for a service object of type '<SetMapAction-request>"
  "edufill_srvs/SetMapActionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMapAction-request)))
  "Returns string type for a service object of type 'SetMapAction-request"
  "edufill_srvs/SetMapActionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetMapAction-request>)))
  "Returns md5sum for a message object of type '<SetMapAction-request>"
  "11679062edf334961e00892cd3b0ed06")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetMapAction-request)))
  "Returns md5sum for a message object of type 'SetMapAction-request"
  "11679062edf334961e00892cd3b0ed06")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetMapAction-request>)))
  "Returns full string definition for message of type '<SetMapAction-request>"
  (cl:format cl:nil "string action~%string file_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetMapAction-request)))
  "Returns full string definition for message of type 'SetMapAction-request"
  (cl:format cl:nil "string action~%string file_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetMapAction-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'action))
     4 (cl:length (cl:slot-value msg 'file_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetMapAction-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetMapAction-request
    (cl:cons ':action (action msg))
    (cl:cons ':file_name (file_name msg))
))
;//! \htmlinclude SetMapAction-response.msg.html

(cl:defclass <SetMapAction-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetMapAction-response (<SetMapAction-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetMapAction-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetMapAction-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<SetMapAction-response> is deprecated: use edufill_srvs-srv:SetMapAction-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetMapAction-response>) ostream)
  "Serializes a message object of type '<SetMapAction-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetMapAction-response>) istream)
  "Deserializes a message object of type '<SetMapAction-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetMapAction-response>)))
  "Returns string type for a service object of type '<SetMapAction-response>"
  "edufill_srvs/SetMapActionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMapAction-response)))
  "Returns string type for a service object of type 'SetMapAction-response"
  "edufill_srvs/SetMapActionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetMapAction-response>)))
  "Returns md5sum for a message object of type '<SetMapAction-response>"
  "11679062edf334961e00892cd3b0ed06")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetMapAction-response)))
  "Returns md5sum for a message object of type 'SetMapAction-response"
  "11679062edf334961e00892cd3b0ed06")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetMapAction-response>)))
  "Returns full string definition for message of type '<SetMapAction-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetMapAction-response)))
  "Returns full string definition for message of type 'SetMapAction-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetMapAction-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetMapAction-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetMapAction-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetMapAction)))
  'SetMapAction-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetMapAction)))
  'SetMapAction-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMapAction)))
  "Returns string type for a service object of type '<SetMapAction>"
  "edufill_srvs/SetMapAction")