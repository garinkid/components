; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude ExtractPlanes-request.msg.html

(cl:defclass <ExtractPlanes-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ExtractPlanes-request (<ExtractPlanes-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExtractPlanes-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExtractPlanes-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<ExtractPlanes-request> is deprecated: use edufill_srvs-srv:ExtractPlanes-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExtractPlanes-request>) ostream)
  "Serializes a message object of type '<ExtractPlanes-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExtractPlanes-request>) istream)
  "Deserializes a message object of type '<ExtractPlanes-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExtractPlanes-request>)))
  "Returns string type for a service object of type '<ExtractPlanes-request>"
  "edufill_srvs/ExtractPlanesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExtractPlanes-request)))
  "Returns string type for a service object of type 'ExtractPlanes-request"
  "edufill_srvs/ExtractPlanesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExtractPlanes-request>)))
  "Returns md5sum for a message object of type '<ExtractPlanes-request>"
  "7a7315a968ecb96dca1d6bb20d5e284c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExtractPlanes-request)))
  "Returns md5sum for a message object of type 'ExtractPlanes-request"
  "7a7315a968ecb96dca1d6bb20d5e284c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExtractPlanes-request>)))
  "Returns full string definition for message of type '<ExtractPlanes-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExtractPlanes-request)))
  "Returns full string definition for message of type 'ExtractPlanes-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExtractPlanes-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExtractPlanes-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ExtractPlanes-request
))
;//! \htmlinclude ExtractPlanes-response.msg.html

(cl:defclass <ExtractPlanes-response> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (planarpolygons
    :reader planarpolygons
    :initarg :planarpolygons
    :type (cl:vector hbrs_msgs-msg:PlanarPolygon)
   :initform (cl:make-array 0 :element-type 'hbrs_msgs-msg:PlanarPolygon :initial-element (cl:make-instance 'hbrs_msgs-msg:PlanarPolygon))))
)

(cl:defclass ExtractPlanes-response (<ExtractPlanes-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExtractPlanes-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExtractPlanes-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<ExtractPlanes-response> is deprecated: use edufill_srvs-srv:ExtractPlanes-response instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <ExtractPlanes-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:stamp-val is deprecated.  Use edufill_srvs-srv:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'planarpolygons-val :lambda-list '(m))
(cl:defmethod planarpolygons-val ((m <ExtractPlanes-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:planarpolygons-val is deprecated.  Use edufill_srvs-srv:planarpolygons instead.")
  (planarpolygons m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExtractPlanes-response>) ostream)
  "Serializes a message object of type '<ExtractPlanes-response>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'planarpolygons))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'planarpolygons))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExtractPlanes-response>) istream)
  "Deserializes a message object of type '<ExtractPlanes-response>"
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'planarpolygons) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'planarpolygons)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'hbrs_msgs-msg:PlanarPolygon))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExtractPlanes-response>)))
  "Returns string type for a service object of type '<ExtractPlanes-response>"
  "edufill_srvs/ExtractPlanesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExtractPlanes-response)))
  "Returns string type for a service object of type 'ExtractPlanes-response"
  "edufill_srvs/ExtractPlanesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExtractPlanes-response>)))
  "Returns md5sum for a message object of type '<ExtractPlanes-response>"
  "7a7315a968ecb96dca1d6bb20d5e284c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExtractPlanes-response)))
  "Returns md5sum for a message object of type 'ExtractPlanes-response"
  "7a7315a968ecb96dca1d6bb20d5e284c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExtractPlanes-response>)))
  "Returns full string definition for message of type '<ExtractPlanes-response>"
  (cl:format cl:nil "~%time stamp~%~%~%hbrs_msgs/PlanarPolygon[] planarpolygons~%~%~%~%================================================================================~%MSG: hbrs_msgs/PlanarPolygon~%# This message is a wrapper for the PCL datatype PlanarPolygon.~%# http://docs.pointclouds.org/trunk/classpcl_1_1_planar_polygon.html~%~%# Plane coefficients~%float32[4] coefficients~%# List of points in the contour~%geometry_msgs/Point32[] contour~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExtractPlanes-response)))
  "Returns full string definition for message of type 'ExtractPlanes-response"
  (cl:format cl:nil "~%time stamp~%~%~%hbrs_msgs/PlanarPolygon[] planarpolygons~%~%~%~%================================================================================~%MSG: hbrs_msgs/PlanarPolygon~%# This message is a wrapper for the PCL datatype PlanarPolygon.~%# http://docs.pointclouds.org/trunk/classpcl_1_1_planar_polygon.html~%~%# Plane coefficients~%float32[4] coefficients~%# List of points in the contour~%geometry_msgs/Point32[] contour~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExtractPlanes-response>))
  (cl:+ 0
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'planarpolygons) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExtractPlanes-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ExtractPlanes-response
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':planarpolygons (planarpolygons msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ExtractPlanes)))
  'ExtractPlanes-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ExtractPlanes)))
  'ExtractPlanes-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExtractPlanes)))
  "Returns string type for a service object of type '<ExtractPlanes>"
  "edufill_srvs/ExtractPlanes")