; Auto-generated. Do not edit!


(cl:in-package image_process-msg)


;//! \htmlinclude faceInfo.msg.html

(cl:defclass <faceInfo> (roslisp-msg-protocol:ros-message)
  ((centerPointX
    :reader centerPointX
    :initarg :centerPointX
    :type cl:fixnum
    :initform 0)
   (centerPointY
    :reader centerPointY
    :initarg :centerPointY
    :type cl:fixnum
    :initform 0)
   (size
    :reader size
    :initarg :size
    :type cl:fixnum
    :initform 0))
)

(cl:defclass faceInfo (<faceInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <faceInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'faceInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_process-msg:<faceInfo> is deprecated: use image_process-msg:faceInfo instead.")))

(cl:ensure-generic-function 'centerPointX-val :lambda-list '(m))
(cl:defmethod centerPointX-val ((m <faceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_process-msg:centerPointX-val is deprecated.  Use image_process-msg:centerPointX instead.")
  (centerPointX m))

(cl:ensure-generic-function 'centerPointY-val :lambda-list '(m))
(cl:defmethod centerPointY-val ((m <faceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_process-msg:centerPointY-val is deprecated.  Use image_process-msg:centerPointY instead.")
  (centerPointY m))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <faceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_process-msg:size-val is deprecated.  Use image_process-msg:size instead.")
  (size m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <faceInfo>) ostream)
  "Serializes a message object of type '<faceInfo>"
  (cl:let* ((signed (cl:slot-value msg 'centerPointX)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'centerPointY)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'size)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <faceInfo>) istream)
  "Deserializes a message object of type '<faceInfo>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'centerPointX) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'centerPointY) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'size) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<faceInfo>)))
  "Returns string type for a message object of type '<faceInfo>"
  "image_process/faceInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'faceInfo)))
  "Returns string type for a message object of type 'faceInfo"
  "image_process/faceInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<faceInfo>)))
  "Returns md5sum for a message object of type '<faceInfo>"
  "09861ec5a192c12395d479660bb452ff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'faceInfo)))
  "Returns md5sum for a message object of type 'faceInfo"
  "09861ec5a192c12395d479660bb452ff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<faceInfo>)))
  "Returns full string definition for message of type '<faceInfo>"
  (cl:format cl:nil "int16 centerPointX~%int16 centerPointY~%int16 size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'faceInfo)))
  "Returns full string definition for message of type 'faceInfo"
  (cl:format cl:nil "int16 centerPointX~%int16 centerPointY~%int16 size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <faceInfo>))
  (cl:+ 0
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <faceInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'faceInfo
    (cl:cons ':centerPointX (centerPointX msg))
    (cl:cons ':centerPointY (centerPointY msg))
    (cl:cons ':size (size msg))
))
