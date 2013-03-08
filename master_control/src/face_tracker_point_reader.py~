#!/usr/bin/env python
import roslib; roslib.load_manifest('image_process')
import rospy
from std_msgs.msg import String
import shlex
import tf.transformations
from image_process.msg import faceInfo
from std_msgs.msg import Empty       	 # for land/takeoff/emergency

#this Publisher wil be used to send commands to the actual drone tracker
pub = rospy.Publisher('commandSent',String)

#screen size is set to (640,480) so x and y will only come at max those coordinates.
#these are being used to check drone location on screen and publish command to move.
#im using half x/y plus amount to make box in middle so if drone is there no commands sent
isLeft =  280 #(640/2 -40)
isRight = 360 #(640/2 +40)
isUp = 210 #(480/2 -30)
isDown = 270 #(480/2 +30)
size = 90 #random width and height

# Create a callback function for the subscriber.
def callback(msg):
#prints the data from camera about points
    rospy.loginfo(" Point x:[%f]" %(msg.centerPointX))    
    rospy.loginfo(" Point y:[%f]" %(msg.centerPointY))    
    rospy.loginfo(" width :[%f]" %(msg.width))    
    rospy.loginfo(" height :[%f]" %(msg.height)) 
    rospy.loginfo(" ") 

#this will send a letter to the ardrone movement node which will tell it
#which way it should move
#x max = 640, y max = 480
def sendcommand(msg):
	if msg.centerPointX <= isLeft and msg.centerPointX != 0:
		pub.publish("moveRight")
	elif msg.centerPointX >= isRight:
		pub.publish("moveLeft")
	elif msg.centerPointY <= isUp and msg.centerPointY != 0:
		pub.publish("moveUp")
	elif msg.centerPointY >= isDown:
		pub.publish("moveDown")
	elif (msg.centerPointX == 0.0 and msg.centerPointY == 0.0) or (msg.centerPointX <= isRight and msg.centerPointX >= isLeft and msg.centerPointY >= isUp and msg.centerPointY <= isDown):
		pub.publish("object not found")
	elif msg.size > size:
		pub.publish("moveBackward")
	elif msg.size < size:
		pub.publish("moveForward")

# This ends up being the main while loop.
def listener():
    	rospy.on_shutdown(land)
	#rospy.Subscriber('face_track', faceInfo, callback)
	rospy.Subscriber('face_track', faceInfo, sendcommand)
	rospy.spin()
    
def takeOff():
	pub.publish("Takeoff")	
	rospy.Publisher('/ardrone/takeoff',Empty)

def land():
	pub.publish("Land")	
	rospy.Publisher('/ardrone/land',Empty)

# Main function.
if __name__ == '__main__':
	rospy.init_node('face_tracker_point_reader', anonymous = True)
	#rospy.sleep(3)
	#takeOff()
	#rospy.sleep(3)
	#land()
	listener()
	

