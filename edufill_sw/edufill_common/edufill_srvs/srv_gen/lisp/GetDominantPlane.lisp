; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude GetDominantPlane-request.msg.html

(cl:defclass <GetDominantPlane-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetDominantPlane-request (<GetDominantPlane-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetDominantPlane-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetDominantPlane-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<GetDominantPlane-request> is deprecated: use edufill_srvs-srv:GetDominantPlane-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetDominantPlane-request>) ostream)
  "Serializes a message object of type '<GetDominantPlane-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetDominantPlane-request>) istream)
  "Deserializes a message object of type '<GetDominantPlane-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetDominantPlane-request>)))
  "Returns string type for a service object of type '<GetDominantPlane-request>"
  "edufill_srvs/GetDominantPlaneRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDominantPlane-request)))
  "Returns string type for a service object of type 'GetDominantPlane-request"
  "edufill_srvs/GetDominantPlaneRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetDominantPlane-request>)))
  "Returns md5sum for a message object of type '<GetDominantPlane-request>"
  "2ae62413083f6a5601988ea95374f5d8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetDominantPlane-request)))
  "Returns md5sum for a message object of type 'GetDominantPlane-request"
  "2ae62413083f6a5601988ea95374f5d8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetDominantPlane-request>)))
  "Returns full string definition for message of type '<GetDominantPlane-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetDominantPlane-request)))
  "Returns full string definition for message of type 'GetDominantPlane-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetDominantPlane-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetDominantPlane-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetDominantPlane-request
))
;//! \htmlinclude GetDominantPlane-response.msg.html

(cl:defclass <GetDominantPlane-response> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (coefficients
    :reader coefficients
    :initarg :coefficients
    :type (cl:vector cl:float)
   :initform (cl:make-array 4 :element-type 'cl:float :initial-element 0.0))
   (contour
    :reader contour
    :initarg :contour
    :type (cl:vector geometry_msgs-msg:Point32)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point32 :initial-element (cl:make-instance 'geometry_msgs-msg:Point32))))
)

(cl:defclass GetDominantPlane-response (<GetDominantPlane-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetDominantPlane-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetDominantPlane-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<GetDominantPlane-response> is deprecated: use edufill_srvs-srv:GetDominantPlane-response instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <GetDominantPlane-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:stamp-val is deprecated.  Use edufill_srvs-srv:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'coefficients-val :lambda-list '(m))
(cl:defmethod coefficients-val ((m <GetDominantPlane-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:coefficients-val is deprecated.  Use edufill_srvs-srv:coefficients instead.")
  (coefficients m))

(cl:ensure-generic-function 'contour-val :lambda-list '(m))
(cl:defmethod contour-val ((m <GetDominantPlane-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:contour-val is deprecated.  Use edufill_srvs-srv:contour instead.")
  (contour m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetDominantPlane-response>) ostream)
  "Serializes a message object of type '<GetDominantPlane-response>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'stamp) (cl:floor (cl:slot-value msg 'stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'coefficients))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'contour))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'contour))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetDominantPlane-response>) istream)
  "Deserializes a message object of type '<GetDominantPlane-response>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  (cl:setf (cl:slot-value msg 'coefficients) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'coefficients)))
    (cl:dotimes (i 4)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'contour) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'contour)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point32))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetDominantPlane-response>)))
  "Returns string type for a service object of type '<GetDominantPlane-response>"
  "edufill_srvs/GetDominantPlaneResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDominantPlane-response)))
  "Returns string type for a service object of type 'GetDominantPlane-response"
  "edufill_srvs/GetDominantPlaneResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetDominantPlane-response>)))
  "Returns md5sum for a message object of type '<GetDominantPlane-response>"
  "2ae62413083f6a5601988ea95374f5d8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetDominantPlane-response)))
  "Returns md5sum for a message object of type 'GetDominantPlane-response"
  "2ae62413083f6a5601988ea95374f5d8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetDominantPlane-response>)))
  "Returns full string definition for message of type '<GetDominantPlane-response>"
  (cl:format cl:nil "~%time stamp~%~%float32[4] coefficients~%~%geometry_msgs/Point32[] contour~%~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetDominantPlane-response)))
  "Returns full string definition for message of type 'GetDominantPlane-response"
  (cl:format cl:nil "~%time stamp~%~%float32[4] coefficients~%~%geometry_msgs/Point32[] contour~%~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetDominantPlane-response>))
  (cl:+ 0
     8
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'coefficients) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'contour) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetDominantPlane-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetDominantPlane-response
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':coefficients (coefficients msg))
    (cl:cons ':contour (contour msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetDominantPlane)))
  'GetDominantPlane-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetDominantPlane)))
  'GetDominantPlane-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDominantPlane)))
  "Returns string type for a service object of type '<GetDominantPlane>"
  "edufill_srvs/GetDominantPlane")