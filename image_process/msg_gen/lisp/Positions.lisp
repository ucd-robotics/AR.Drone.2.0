; Auto-generated. Do not edit!


(cl:in-package image_process-msg)


;//! \htmlinclude Positions.msg.html

(cl:defclass <Positions> (roslisp-msg-protocol:ros-message)
  ((posX
    :reader posX
    :initarg :posX
    :type cl:fixnum
    :initform 0)
   (posY
    :reader posY
    :initarg :posY
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Positions (<Positions>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Positions>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Positions)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_process-msg:<Positions> is deprecated: use image_process-msg:Positions instead.")))

(cl:ensure-generic-function 'posX-val :lambda-list '(m))
(cl:defmethod posX-val ((m <Positions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_process-msg:posX-val is deprecated.  Use image_process-msg:posX instead.")
  (posX m))

(cl:ensure-generic-function 'posY-val :lambda-list '(m))
(cl:defmethod posY-val ((m <Positions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_process-msg:posY-val is deprecated.  Use image_process-msg:posY instead.")
  (posY m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Positions>) ostream)
  "Serializes a message object of type '<Positions>"
  (cl:let* ((signed (cl:slot-value msg 'posX)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'posY)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Positions>) istream)
  "Deserializes a message object of type '<Positions>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'posX) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'posY) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Positions>)))
  "Returns string type for a message object of type '<Positions>"
  "image_process/Positions")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Positions)))
  "Returns string type for a message object of type 'Positions"
  "image_process/Positions")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Positions>)))
  "Returns md5sum for a message object of type '<Positions>"
  "d45eb622e055a6c42c62b2012431a993")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Positions)))
  "Returns md5sum for a message object of type 'Positions"
  "d45eb622e055a6c42c62b2012431a993")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Positions>)))
  "Returns full string definition for message of type '<Positions>"
  (cl:format cl:nil "int16 posX~%int16 posY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Positions)))
  "Returns full string definition for message of type 'Positions"
  (cl:format cl:nil "int16 posX~%int16 posY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Positions>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Positions>))
  "Converts a ROS message object to a list"
  (cl:list 'Positions
    (cl:cons ':posX (posX msg))
    (cl:cons ':posY (posY msg))
))
