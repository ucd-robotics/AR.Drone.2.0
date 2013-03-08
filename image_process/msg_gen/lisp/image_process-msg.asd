
(cl:in-package :asdf)

(defsystem "image_process-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "faceInfo" :depends-on ("_package_faceInfo"))
    (:file "_package_faceInfo" :depends-on ("_package"))
    (:file "Positions" :depends-on ("_package_Positions"))
    (:file "_package_Positions" :depends-on ("_package"))
  ))