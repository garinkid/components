; Auto-generated. Do not edit!


(cl:in-package edufill_object_detection-srv)


;//! \htmlinclude DetectCube-request.msg.html

(cl:defclass <DetectCube-request> (roslisp-msg-protocol:ros-message)
  ((color
    :reader color
    :initarg :color
    :type cl:string
    :initform "")
   (min_size
    :reader min_size
    :initarg :min_size
    :type cl:fixnum
    :initform 0)
   (max_size
    :reader max_size
    :initarg :max_size
    :type cl:fixnum
    :initform 0))
)

(cl:defclass DetectCube-request (<DetectCube-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DetectCube-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DetectCube-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_object_detection-srv:<DetectCube-request> is deprecated: use edufill_object_detection-srv:DetectCube-request instead.")))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <DetectCube-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_object_detection-srv:color-val is deprecated.  Use edufill_object_detection-srv:color instead.")
  (color m))

(cl:ensure-generic-function 'min_size-val :lambda-list '(m))
(cl:defmethod min_size-val ((m <DetectCube-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_object_detection-srv:min_size-val is deprecated.  Use edufill_object_detection-srv:min_size instead.")
  (min_size m))

(cl:ensure-generic-function 'max_size-val :lambda-list '(m))
(cl:defmethod max_size-val ((m <DetectCube-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_object_detection-srv:max_size-val is deprecated.  Use edufill_object_detection-srv:max_size instead.")
  (max_size m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DetectCube-request>) ostream)
  "Serializes a message object of type '<DetectCube-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'color))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'color))
  (cl:let* ((signed (cl:slot-value msg 'min_size)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'max_size)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DetectCube-request>) istream)
  "Deserializes a message object of type '<DetectCube-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'color) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'color) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'min_size) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'max_size) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DetectCube-request>)))
  "Returns string type for a service object of type '<DetectCube-request>"
  "edufill_object_detection/DetectCubeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DetectCube-request)))
  "Returns string type for a service object of type 'DetectCube-request"
  "edufill_object_detection/DetectCubeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DetectCube-request>)))
  "Returns md5sum for a message object of type '<DetectCube-request>"
  "7283ee19cd007ecacaf194ffe7746dde")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DetectCube-request)))
  "Returns md5sum for a message object of type 'DetectCube-request"
  "7283ee19cd007ecacaf194ffe7746dde")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DetectCube-request>)))
  "Returns full string definition for message of type '<DetectCube-request>"
  (cl:format cl:nil "string color~%int16 min_size~%int16 max_size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DetectCube-request)))
  "Returns full string definition for message of type 'DetectCube-request"
  (cl:format cl:nil "string color~%int16 min_size~%int16 max_size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DetectCube-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'color))
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DetectCube-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DetectCube-request
    (cl:cons ':color (color msg))
    (cl:cons ':min_size (min_size msg))
    (cl:cons ':max_size (max_size msg))
))
;//! \htmlinclude DetectCube-response.msg.html

(cl:defclass <DetectCube-response> (roslisp-msg-protocol:ros-message)
  ((poses
    :reader poses
    :initarg :poses
    :type (cl:vector geometry_msgs-msg:PoseStamped)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:PoseStamped :initial-element (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
   (sizes
    :reader sizes
    :initarg :sizes
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass DetectCube-response (<DetectCube-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DetectCube-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DetectCube-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_object_detection-srv:<DetectCube-response> is deprecated: use edufill_object_detection-srv:DetectCube-response instead.")))

(cl:ensure-generic-function 'poses-val :lambda-list '(m))
(cl:defmethod poses-val ((m <DetectCube-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_object_detection-srv:poses-val is deprecated.  Use edufill_object_detection-srv:poses instead.")
  (poses m))

(cl:ensure-generic-function 'sizes-val :lambda-list '(m))
(cl:defmethod sizes-val ((m <DetectCube-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_object_detection-srv:sizes-val is deprecated.  Use edufill_object_detection-srv:sizes instead.")
  (sizes m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DetectCube-response>) ostream)
  "Serializes a message object of type '<DetectCube-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'poses))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'poses))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sizes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'sizes))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DetectCube-response>) istream)
  "Deserializes a message object of type '<DetectCube-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'poses) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'poses)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:PoseStamped))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sizes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sizes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DetectCube-response>)))
  "Returns string type for a service object of type '<DetectCube-response>"
  "edufill_object_detection/DetectCubeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DetectCube-response)))
  "Returns string type for a service object of type 'DetectCube-response"
  "edufill_object_detection/DetectCubeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DetectCube-response>)))
  "Returns md5sum for a message object of type '<DetectCube-response>"
  "7283ee19cd007ecacaf194ffe7746dde")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DetectCube-response)))
  "Returns md5sum for a message object of type 'DetectCube-response"
  "7283ee19cd007ecacaf194ffe7746dde")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DetectCube-response>)))
  "Returns full string definition for message of type '<DetectCube-response>"
  (cl:format cl:nil "geometry_msgs/PoseStamped[] poses~%int16[] sizes~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DetectCube-response)))
  "Returns full string definition for message of type 'DetectCube-response"
  (cl:format cl:nil "geometry_msgs/PoseStamped[] poses~%int16[] sizes~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DetectCube-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'poses) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sizes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DetectCube-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DetectCube-response
    (cl:cons ':poses (poses msg))
    (cl:cons ':sizes (sizes msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DetectCube)))
  'DetectCube-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DetectCube)))
  'DetectCube-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DetectCube)))
  "Returns string type for a service object of type '<DetectCube>"
  "edufill_object_detection/DetectCube")