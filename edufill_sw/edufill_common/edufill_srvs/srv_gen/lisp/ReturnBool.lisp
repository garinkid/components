; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude ReturnBool-request.msg.html

(cl:defclass <ReturnBool-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ReturnBool-request (<ReturnBool-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReturnBool-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReturnBool-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<ReturnBool-request> is deprecated: use edufill_srvs-srv:ReturnBool-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReturnBool-request>) ostream)
  "Serializes a message object of type '<ReturnBool-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReturnBool-request>) istream)
  "Deserializes a message object of type '<ReturnBool-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReturnBool-request>)))
  "Returns string type for a service object of type '<ReturnBool-request>"
  "edufill_srvs/ReturnBoolRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReturnBool-request)))
  "Returns string type for a service object of type 'ReturnBool-request"
  "edufill_srvs/ReturnBoolRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReturnBool-request>)))
  "Returns md5sum for a message object of type '<ReturnBool-request>"
  "e431d687bf4b2c65fbd94b12ae0cb5d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReturnBool-request)))
  "Returns md5sum for a message object of type 'ReturnBool-request"
  "e431d687bf4b2c65fbd94b12ae0cb5d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReturnBool-request>)))
  "Returns full string definition for message of type '<ReturnBool-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReturnBool-request)))
  "Returns full string definition for message of type 'ReturnBool-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReturnBool-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReturnBool-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ReturnBool-request
))
;//! \htmlinclude ReturnBool-response.msg.html

(cl:defclass <ReturnBool-response> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ReturnBool-response (<ReturnBool-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReturnBool-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReturnBool-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<ReturnBool-response> is deprecated: use edufill_srvs-srv:ReturnBool-response instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <ReturnBool-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:value-val is deprecated.  Use edufill_srvs-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReturnBool-response>) ostream)
  "Serializes a message object of type '<ReturnBool-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'value) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReturnBool-response>) istream)
  "Deserializes a message object of type '<ReturnBool-response>"
    (cl:setf (cl:slot-value msg 'value) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReturnBool-response>)))
  "Returns string type for a service object of type '<ReturnBool-response>"
  "edufill_srvs/ReturnBoolResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReturnBool-response)))
  "Returns string type for a service object of type 'ReturnBool-response"
  "edufill_srvs/ReturnBoolResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReturnBool-response>)))
  "Returns md5sum for a message object of type '<ReturnBool-response>"
  "e431d687bf4b2c65fbd94b12ae0cb5d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReturnBool-response)))
  "Returns md5sum for a message object of type 'ReturnBool-response"
  "e431d687bf4b2c65fbd94b12ae0cb5d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReturnBool-response>)))
  "Returns full string definition for message of type '<ReturnBool-response>"
  (cl:format cl:nil "bool value~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReturnBool-response)))
  "Returns full string definition for message of type 'ReturnBool-response"
  (cl:format cl:nil "bool value~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReturnBool-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReturnBool-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ReturnBool-response
    (cl:cons ':value (value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ReturnBool)))
  'ReturnBool-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ReturnBool)))
  'ReturnBool-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReturnBool)))
  "Returns string type for a service object of type '<ReturnBool>"
  "edufill_srvs/ReturnBool")