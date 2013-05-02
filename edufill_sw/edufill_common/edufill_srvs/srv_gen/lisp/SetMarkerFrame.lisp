; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude SetMarkerFrame-request.msg.html

(cl:defclass <SetMarkerFrame-request> (roslisp-msg-protocol:ros-message)
  ((marker_frame
    :reader marker_frame
    :initarg :marker_frame
    :type cl:string
    :initform ""))
)

(cl:defclass SetMarkerFrame-request (<SetMarkerFrame-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetMarkerFrame-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetMarkerFrame-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<SetMarkerFrame-request> is deprecated: use edufill_srvs-srv:SetMarkerFrame-request instead.")))

(cl:ensure-generic-function 'marker_frame-val :lambda-list '(m))
(cl:defmethod marker_frame-val ((m <SetMarkerFrame-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:marker_frame-val is deprecated.  Use edufill_srvs-srv:marker_frame instead.")
  (marker_frame m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetMarkerFrame-request>) ostream)
  "Serializes a message object of type '<SetMarkerFrame-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'marker_frame))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'marker_frame))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetMarkerFrame-request>) istream)
  "Deserializes a message object of type '<SetMarkerFrame-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'marker_frame) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'marker_frame) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetMarkerFrame-request>)))
  "Returns string type for a service object of type '<SetMarkerFrame-request>"
  "edufill_srvs/SetMarkerFrameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMarkerFrame-request)))
  "Returns string type for a service object of type 'SetMarkerFrame-request"
  "edufill_srvs/SetMarkerFrameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetMarkerFrame-request>)))
  "Returns md5sum for a message object of type '<SetMarkerFrame-request>"
  "d75f08dbfd25638b2dba9c6cf1446f79")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetMarkerFrame-request)))
  "Returns md5sum for a message object of type 'SetMarkerFrame-request"
  "d75f08dbfd25638b2dba9c6cf1446f79")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetMarkerFrame-request>)))
  "Returns full string definition for message of type '<SetMarkerFrame-request>"
  (cl:format cl:nil "string marker_frame~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetMarkerFrame-request)))
  "Returns full string definition for message of type 'SetMarkerFrame-request"
  (cl:format cl:nil "string marker_frame~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetMarkerFrame-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'marker_frame))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetMarkerFrame-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetMarkerFrame-request
    (cl:cons ':marker_frame (marker_frame msg))
))
;//! \htmlinclude SetMarkerFrame-response.msg.html

(cl:defclass <SetMarkerFrame-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetMarkerFrame-response (<SetMarkerFrame-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetMarkerFrame-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetMarkerFrame-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<SetMarkerFrame-response> is deprecated: use edufill_srvs-srv:SetMarkerFrame-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetMarkerFrame-response>) ostream)
  "Serializes a message object of type '<SetMarkerFrame-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetMarkerFrame-response>) istream)
  "Deserializes a message object of type '<SetMarkerFrame-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetMarkerFrame-response>)))
  "Returns string type for a service object of type '<SetMarkerFrame-response>"
  "edufill_srvs/SetMarkerFrameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMarkerFrame-response)))
  "Returns string type for a service object of type 'SetMarkerFrame-response"
  "edufill_srvs/SetMarkerFrameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetMarkerFrame-response>)))
  "Returns md5sum for a message object of type '<SetMarkerFrame-response>"
  "d75f08dbfd25638b2dba9c6cf1446f79")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetMarkerFrame-response)))
  "Returns md5sum for a message object of type 'SetMarkerFrame-response"
  "d75f08dbfd25638b2dba9c6cf1446f79")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetMarkerFrame-response>)))
  "Returns full string definition for message of type '<SetMarkerFrame-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetMarkerFrame-response)))
  "Returns full string definition for message of type 'SetMarkerFrame-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetMarkerFrame-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetMarkerFrame-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetMarkerFrame-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetMarkerFrame)))
  'SetMarkerFrame-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetMarkerFrame)))
  'SetMarkerFrame-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMarkerFrame)))
  "Returns string type for a service object of type '<SetMarkerFrame>"
  "edufill_srvs/SetMarkerFrame")