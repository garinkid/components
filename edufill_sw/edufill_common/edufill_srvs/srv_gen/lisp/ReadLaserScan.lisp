; Auto-generated. Do not edit!


(cl:in-package edufill_srvs-srv)


;//! \htmlinclude ReadLaserScan-request.msg.html

(cl:defclass <ReadLaserScan-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ReadLaserScan-request (<ReadLaserScan-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadLaserScan-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadLaserScan-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<ReadLaserScan-request> is deprecated: use edufill_srvs-srv:ReadLaserScan-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadLaserScan-request>) ostream)
  "Serializes a message object of type '<ReadLaserScan-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadLaserScan-request>) istream)
  "Deserializes a message object of type '<ReadLaserScan-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadLaserScan-request>)))
  "Returns string type for a service object of type '<ReadLaserScan-request>"
  "edufill_srvs/ReadLaserScanRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadLaserScan-request)))
  "Returns string type for a service object of type 'ReadLaserScan-request"
  "edufill_srvs/ReadLaserScanRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadLaserScan-request>)))
  "Returns md5sum for a message object of type '<ReadLaserScan-request>"
  "11de34d8c079caf4e10311308a30ab23")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadLaserScan-request)))
  "Returns md5sum for a message object of type 'ReadLaserScan-request"
  "11de34d8c079caf4e10311308a30ab23")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadLaserScan-request>)))
  "Returns full string definition for message of type '<ReadLaserScan-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadLaserScan-request)))
  "Returns full string definition for message of type 'ReadLaserScan-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadLaserScan-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadLaserScan-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadLaserScan-request
))
;//! \htmlinclude ReadLaserScan-response.msg.html

(cl:defclass <ReadLaserScan-response> (roslisp-msg-protocol:ros-message)
  ((laser_scan_data
    :reader laser_scan_data
    :initarg :laser_scan_data
    :type sensor_msgs-msg:LaserScan
    :initform (cl:make-instance 'sensor_msgs-msg:LaserScan)))
)

(cl:defclass ReadLaserScan-response (<ReadLaserScan-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReadLaserScan-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReadLaserScan-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_srvs-srv:<ReadLaserScan-response> is deprecated: use edufill_srvs-srv:ReadLaserScan-response instead.")))

(cl:ensure-generic-function 'laser_scan_data-val :lambda-list '(m))
(cl:defmethod laser_scan_data-val ((m <ReadLaserScan-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_srvs-srv:laser_scan_data-val is deprecated.  Use edufill_srvs-srv:laser_scan_data instead.")
  (laser_scan_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReadLaserScan-response>) ostream)
  "Serializes a message object of type '<ReadLaserScan-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'laser_scan_data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReadLaserScan-response>) istream)
  "Deserializes a message object of type '<ReadLaserScan-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'laser_scan_data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReadLaserScan-response>)))
  "Returns string type for a service object of type '<ReadLaserScan-response>"
  "edufill_srvs/ReadLaserScanResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadLaserScan-response)))
  "Returns string type for a service object of type 'ReadLaserScan-response"
  "edufill_srvs/ReadLaserScanResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReadLaserScan-response>)))
  "Returns md5sum for a message object of type '<ReadLaserScan-response>"
  "11de34d8c079caf4e10311308a30ab23")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReadLaserScan-response)))
  "Returns md5sum for a message object of type 'ReadLaserScan-response"
  "11de34d8c079caf4e10311308a30ab23")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReadLaserScan-response>)))
  "Returns full string definition for message of type '<ReadLaserScan-response>"
  (cl:format cl:nil "sensor_msgs/LaserScan laser_scan_data~%~%~%================================================================================~%MSG: sensor_msgs/LaserScan~%# Single scan from a planar laser range-finder~%#~%# If you have another ranging device with different behavior (e.g. a sonar~%# array), please find or create a different message, since applications~%# will make fairly laser-specific assumptions about this data~%~%Header header            # timestamp in the header is the acquisition time of ~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around ~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%                         ~%float32 angle_min        # start angle of the scan [rad]~%float32 angle_max        # end angle of the scan [rad]~%float32 angle_increment  # angular distance between measurements [rad]~%~%float32 time_increment   # time between measurements [seconds] - if your scanner~%                         # is moving, this will be used in interpolating position~%                         # of 3d points~%float32 scan_time        # time between scans [seconds]~%~%float32 range_min        # minimum range value [m]~%float32 range_max        # maximum range value [m]~%~%float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be discarded)~%float32[] intensities    # intensity data [device-specific units].  If your~%                         # device does not provide intensities, please leave~%                         # the array empty.~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReadLaserScan-response)))
  "Returns full string definition for message of type 'ReadLaserScan-response"
  (cl:format cl:nil "sensor_msgs/LaserScan laser_scan_data~%~%~%================================================================================~%MSG: sensor_msgs/LaserScan~%# Single scan from a planar laser range-finder~%#~%# If you have another ranging device with different behavior (e.g. a sonar~%# array), please find or create a different message, since applications~%# will make fairly laser-specific assumptions about this data~%~%Header header            # timestamp in the header is the acquisition time of ~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around ~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%                         ~%float32 angle_min        # start angle of the scan [rad]~%float32 angle_max        # end angle of the scan [rad]~%float32 angle_increment  # angular distance between measurements [rad]~%~%float32 time_increment   # time between measurements [seconds] - if your scanner~%                         # is moving, this will be used in interpolating position~%                         # of 3d points~%float32 scan_time        # time between scans [seconds]~%~%float32 range_min        # minimum range value [m]~%float32 range_max        # maximum range value [m]~%~%float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be discarded)~%float32[] intensities    # intensity data [device-specific units].  If your~%                         # device does not provide intensities, please leave~%                         # the array empty.~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReadLaserScan-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'laser_scan_data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReadLaserScan-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ReadLaserScan-response
    (cl:cons ':laser_scan_data (laser_scan_data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ReadLaserScan)))
  'ReadLaserScan-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ReadLaserScan)))
  'ReadLaserScan-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReadLaserScan)))
  "Returns string type for a service object of type '<ReadLaserScan>"
  "edufill_srvs/ReadLaserScan")