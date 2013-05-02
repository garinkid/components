; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude RecognizeObject-request.msg.html

(cl:defclass <RecognizeObject-request> (roslisp-msg-protocol:ros-message)
  ((cloud
    :reader cloud
    :initarg :cloud
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (dimensions
    :reader dimensions
    :initarg :dimensions
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass RecognizeObject-request (<RecognizeObject-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RecognizeObject-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RecognizeObject-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<RecognizeObject-request> is deprecated: use edufill_srvs-srv:RecognizeObject-request instead.")))

(cl:ensure-generic-function 'cloud-val :lambda-list '(m))
(cl:defmethod cloud-val ((m <RecognizeObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:cloud-val is deprecated.  Use edufill_srvs-srv:cloud instead.")
  (cloud m))

(cl:ensure-generic-function 'dimensions-val :lambda-list '(m))
(cl:defmethod dimensions-val ((m <RecognizeObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:dimensions-val is deprecated.  Use edufill_srvs-srv:dimensions instead.")
  (dimensions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RecognizeObject-request>) ostream)
  "Serializes a message object of type '<RecognizeObject-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cloud) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'dimensions) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RecognizeObject-request>) istream)
  "Deserializes a message object of type '<RecognizeObject-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cloud) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'dimensions) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RecognizeObject-request>)))
  "Returns string type for a service object of type '<RecognizeObject-request>"
  "edufill_srvs/RecognizeObjectRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RecognizeObject-request)))
  "Returns string type for a service object of type 'RecognizeObject-request"
  "edufill_srvs/RecognizeObjectRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RecognizeObject-request>)))
  "Returns md5sum for a message object of type '<RecognizeObject-request>"
  "c44e38bc34344a59afdaff8bddf56b65")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RecognizeObject-request)))
  "Returns md5sum for a message object of type 'RecognizeObject-request"
  "c44e38bc34344a59afdaff8bddf56b65")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RecognizeObject-request>)))
  "Returns full string definition for message of type '<RecognizeObject-request>"
  (cl:format cl:nil "~%sensor_msgs/PointCloud2 cloud~%~%geometry_msgs/Vector3 dimensions~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RecognizeObject-request)))
  "Returns full string definition for message of type 'RecognizeObject-request"
  (cl:format cl:nil "~%sensor_msgs/PointCloud2 cloud~%~%geometry_msgs/Vector3 dimensions~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RecognizeObject-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cloud))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'dimensions))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RecognizeObject-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RecognizeObject-request
    (cl:cons ':cloud (cloud msg))
    (cl:cons ':dimensions (dimensions msg))
))
;//! \htmlinclude RecognizeObject-response.msg.html

(cl:defclass <RecognizeObject-response> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass RecognizeObject-response (<RecognizeObject-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RecognizeObject-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RecognizeObject-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<RecognizeObject-response> is deprecated: use edufill_srvs-srv:RecognizeObject-response instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <RecognizeObject-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:name-val is deprecated.  Use edufill_srvs-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RecognizeObject-response>) ostream)
  "Serializes a message object of type '<RecognizeObject-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RecognizeObject-response>) istream)
  "Deserializes a message object of type '<RecognizeObject-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RecognizeObject-response>)))
  "Returns string type for a service object of type '<RecognizeObject-response>"
  "edufill_srvs/RecognizeObjectResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RecognizeObject-response)))
  "Returns string type for a service object of type 'RecognizeObject-response"
  "edufill_srvs/RecognizeObjectResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RecognizeObject-response>)))
  "Returns md5sum for a message object of type '<RecognizeObject-response>"
  "c44e38bc34344a59afdaff8bddf56b65")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RecognizeObject-response)))
  "Returns md5sum for a message object of type 'RecognizeObject-response"
  "c44e38bc34344a59afdaff8bddf56b65")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RecognizeObject-response>)))
  "Returns full string definition for message of type '<RecognizeObject-response>"
  (cl:format cl:nil "string name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RecognizeObject-response)))
  "Returns full string definition for message of type 'RecognizeObject-response"
  (cl:format cl:nil "string name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RecognizeObject-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RecognizeObject-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RecognizeObject-response
    (cl:cons ':name (name msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RecognizeObject)))
  'RecognizeObject-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RecognizeObject)))
  'RecognizeObject-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RecognizeObject)))
  "Returns string type for a service object of type '<RecognizeObject>"
  "edufill_srvs/RecognizeObject")