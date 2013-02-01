; Auto-generated. Do not edit!


(cl:in-package image_process-msg)


;//! \htmlinclude Positions.msg.html

(cl:defclass <Positions> (roslisp-msg-protocol:ros-message)
  ((PosX
    :reader PosX
    :initarg :PosX
    :type cl:fixnum
    :initform 0)
   (PosY
    :reader PosY
    :initarg :PosY
    :type cl:fixnum
    :initform 0)
   (ScreenX
    :reader ScreenX
    :initarg :ScreenX
    :type cl:fixnum
    :initform 0)
   (ScreenY
    :reader ScreenY
    :initarg :ScreenY
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Positions (<Positions>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Positions>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Positions)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name image_process-msg:<Positions> is deprecated: use image_process-msg:Positions instead.")))

(cl:ensure-generic-function 'PosX-val :lambda-list '(m))
(cl:defmethod PosX-val ((m <Positions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_process-msg:PosX-val is deprecated.  Use image_process-msg:PosX instead.")
  (PosX m))

(cl:ensure-generic-function 'PosY-val :lambda-list '(m))
(cl:defmethod PosY-val ((m <Positions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_process-msg:PosY-val is deprecated.  Use image_process-msg:PosY instead.")
  (PosY m))

(cl:ensure-generic-function 'ScreenX-val :lambda-list '(m))
(cl:defmethod ScreenX-val ((m <Positions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_process-msg:ScreenX-val is deprecated.  Use image_process-msg:ScreenX instead.")
  (ScreenX m))

(cl:ensure-generic-function 'ScreenY-val :lambda-list '(m))
(cl:defmethod ScreenY-val ((m <Positions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader image_process-msg:ScreenY-val is deprecated.  Use image_process-msg:ScreenY instead.")
  (ScreenY m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Positions>) ostream)
  "Serializes a message object of type '<Positions>"
  (cl:let* ((signed (cl:slot-value msg 'PosX)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'PosY)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ScreenX)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ScreenY)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Positions>) istream)
  "Deserializes a message object of type '<Positions>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'PosX) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'PosY) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ScreenX) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ScreenY) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
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
  "70cb3425bc63edba3285feecb7b2dd58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Positions)))
  "Returns md5sum for a message object of type 'Positions"
  "70cb3425bc63edba3285feecb7b2dd58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Positions>)))
  "Returns full string definition for message of type '<Positions>"
  (cl:format cl:nil "int16 PosX~%int16 PosY~%int16 ScreenX~%int16 ScreenY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Positions)))
  "Returns full string definition for message of type 'Positions"
  (cl:format cl:nil "int16 PosX~%int16 PosY~%int16 ScreenX~%int16 ScreenY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Positions>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Positions>))
  "Converts a ROS message object to a list"
  (cl:list 'Positions
    (cl:cons ':PosX (PosX msg))
    (cl:cons ':PosY (PosY msg))
    (cl:cons ':ScreenX (ScreenX msg))
    (cl:cons ':ScreenY (ScreenY msg))
))
