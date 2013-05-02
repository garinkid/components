; Auto-generated. Do not edit!


(cl:in-package edufill_script_server-msg)


;//! \htmlinclude ScriptGoal.msg.html

(cl:defclass <ScriptGoal> (roslisp-msg-protocol:ros-message)
  ((function_name
    :reader function_name
    :initarg :function_name
    :type cl:string
    :initform "")
   (component_name
    :reader component_name
    :initarg :component_name
    :type cl:string
    :initform "")
   (parameter_name
    :reader parameter_name
    :initarg :parameter_name
    :type cl:string
    :initform "")
   (mode
    :reader mode
    :initarg :mode
    :type cl:string
    :initform ""))
)

(cl:defclass ScriptGoal (<ScriptGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ScriptGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ScriptGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_script_server-msg:<ScriptGoal> is deprecated: use edufill_script_server-msg:ScriptGoal instead.")))

(cl:ensure-generic-function 'function_name-val :lambda-list '(m))
(cl:defmethod function_name-val ((m <ScriptGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_script_server-msg:function_name-val is deprecated.  Use edufill_script_server-msg:function_name instead.")
  (function_name m))

(cl:ensure-generic-function 'component_name-val :lambda-list '(m))
(cl:defmethod component_name-val ((m <ScriptGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_script_server-msg:component_name-val is deprecated.  Use edufill_script_server-msg:component_name instead.")
  (component_name m))

(cl:ensure-generic-function 'parameter_name-val :lambda-list '(m))
(cl:defmethod parameter_name-val ((m <ScriptGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_script_server-msg:parameter_name-val is deprecated.  Use edufill_script_server-msg:parameter_name instead.")
  (parameter_name m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <ScriptGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_script_server-msg:mode-val is deprecated.  Use edufill_script_server-msg:mode instead.")
  (mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ScriptGoal>) ostream)
  "Serializes a message object of type '<ScriptGoal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'function_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'function_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'component_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'component_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'parameter_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'parameter_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mode))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ScriptGoal>) istream)
  "Deserializes a message object of type '<ScriptGoal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'function_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'function_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'component_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'component_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'parameter_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'parameter_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ScriptGoal>)))
  "Returns string type for a message object of type '<ScriptGoal>"
  "edufill_script_server/ScriptGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ScriptGoal)))
  "Returns string type for a message object of type 'ScriptGoal"
  "edufill_script_server/ScriptGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ScriptGoal>)))
  "Returns md5sum for a message object of type '<ScriptGoal>"
  "b8ba419c917044eefb668c2e3c0f4e65")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ScriptGoal)))
  "Returns md5sum for a message object of type 'ScriptGoal"
  "b8ba419c917044eefb668c2e3c0f4e65")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ScriptGoal>)))
  "Returns full string definition for message of type '<ScriptGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%string function_name~%string component_name~%string parameter_name~%string mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ScriptGoal)))
  "Returns full string definition for message of type 'ScriptGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%string function_name~%string component_name~%string parameter_name~%string mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ScriptGoal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'function_name))
     4 (cl:length (cl:slot-value msg 'component_name))
     4 (cl:length (cl:slot-value msg 'parameter_name))
     4 (cl:length (cl:slot-value msg 'mode))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ScriptGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'ScriptGoal
    (cl:cons ':function_name (function_name msg))
    (cl:cons ':component_name (component_name msg))
    (cl:cons ':parameter_name (parameter_name msg))
    (cl:cons ':mode (mode msg))
))
