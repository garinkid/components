; Auto-generated. Do not edit!


(cl:in-package edufill_2dnav-srv)


;//! \htmlinclude GoalCheck-request.msg.html

(cl:defclass <GoalCheck-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass GoalCheck-request (<GoalCheck-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoalCheck-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoalCheck-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_2dnav-srv:<GoalCheck-request> is deprecated: use edufill_2dnav-srv:GoalCheck-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <GoalCheck-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_2dnav-srv:pose-val is deprecated.  Use edufill_2dnav-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoalCheck-request>) ostream)
  "Serializes a message object of type '<GoalCheck-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoalCheck-request>) istream)
  "Deserializes a message object of type '<GoalCheck-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoalCheck-request>)))
  "Returns string type for a service object of type '<GoalCheck-request>"
  "edufill_2dnav/GoalCheckRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoalCheck-request)))
  "Returns string type for a service object of type 'GoalCheck-request"
  "edufill_2dnav/GoalCheckRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoalCheck-request>)))
  "Returns md5sum for a message object of type '<GoalCheck-request>"
  "20cdfa6c42ac124b135680669c40b0d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoalCheck-request)))
  "Returns md5sum for a message object of type 'GoalCheck-request"
  "20cdfa6c42ac124b135680669c40b0d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoalCheck-request>)))
  "Returns full string definition for message of type '<GoalCheck-request>"
  (cl:format cl:nil "geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoalCheck-request)))
  "Returns full string definition for message of type 'GoalCheck-request"
  (cl:format cl:nil "geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoalCheck-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoalCheck-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GoalCheck-request
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude GoalCheck-response.msg.html

(cl:defclass <GoalCheck-response> (roslisp-msg-protocol:ros-message)
  ((feasible
    :reader feasible
    :initarg :feasible
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GoalCheck-response (<GoalCheck-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoalCheck-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoalCheck-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_2dnav-srv:<GoalCheck-response> is deprecated: use edufill_2dnav-srv:GoalCheck-response instead.")))

(cl:ensure-generic-function 'feasible-val :lambda-list '(m))
(cl:defmethod feasible-val ((m <GoalCheck-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_2dnav-srv:feasible-val is deprecated.  Use edufill_2dnav-srv:feasible instead.")
  (feasible m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoalCheck-response>) ostream)
  "Serializes a message object of type '<GoalCheck-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'feasible) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoalCheck-response>) istream)
  "Deserializes a message object of type '<GoalCheck-response>"
    (cl:setf (cl:slot-value msg 'feasible) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoalCheck-response>)))
  "Returns string type for a service object of type '<GoalCheck-response>"
  "edufill_2dnav/GoalCheckResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoalCheck-response)))
  "Returns string type for a service object of type 'GoalCheck-response"
  "edufill_2dnav/GoalCheckResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoalCheck-response>)))
  "Returns md5sum for a message object of type '<GoalCheck-response>"
  "20cdfa6c42ac124b135680669c40b0d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoalCheck-response)))
  "Returns md5sum for a message object of type 'GoalCheck-response"
  "20cdfa6c42ac124b135680669c40b0d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoalCheck-response>)))
  "Returns full string definition for message of type '<GoalCheck-response>"
  (cl:format cl:nil "bool feasible~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoalCheck-response)))
  "Returns full string definition for message of type 'GoalCheck-response"
  (cl:format cl:nil "bool feasible~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoalCheck-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoalCheck-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GoalCheck-response
    (cl:cons ':feasible (feasible msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GoalCheck)))
  'GoalCheck-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GoalCheck)))
  'GoalCheck-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoalCheck)))
  "Returns string type for a service object of type '<GoalCheck>"
  "edufill_2dnav/GoalCheck")