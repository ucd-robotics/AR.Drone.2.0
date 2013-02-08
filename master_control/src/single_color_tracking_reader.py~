#!/usr/bin/env python
import roslib; roslib.load_manifest('image_process')
import rospy
from std_msgs.msg import String
import shlex
import tf.transformations
from image_process.msg import Positions
from std_msgs.msg import Empty       	 # for land/takeoff/emergency

pub = rospy.Publisher('commandSent',String)

#screen size is set to (640,480) so x and y will only come at max those coordinates.
#these are being used to check drone location on screen and publish command to move.
#im using half x/y plus amount to make box in middle so if drone is there no commands sent
isLeft =  290 #(640/2 -30)
isRight = 350 #(640/2 +30)
isUp = 220 #(480/2 -20)
isDown = 260 #(480/2 +20)

# Create a callback function for the subscriber.
def callback(msg):
#prints the data from camera about points
    #rospy.loginfo(" I heard %s", msg)
    rospy.loginfo(" Point x:[%f]" %(msg.PosX))    
    rospy.loginfo(" Point y:[%f]" %(msg.PosY))    
    #rospy.loginfo("Linear Components: [%f, %f]"%(msg.linear.x, msg.linear.y))

#this will send a letter to the ardrone movement node which will tell it
#which way it should move
#x max = 639, y max = 479
def sendcommand(msg):
	if msg.PosX <= isLeft and msg.PosX != 0:
		pub.publish("moveRight")
	elif msg.PosX >= isRight:
		pub.publish("moveLeft")
	elif msg.PosY <= isUp and msg.PosY != 0:
		pub.publish("moveDown")
	elif msg.PosY >= isDown:
		pub.publish("moveUp")
	elif msg.PosX == 0.0 and msg.PosY == 0.0:
		pub.publish("object not found")

# This ends up being the main while loop.
def listener():
	if not rospy.is_shutdown(): 
	    rospy.Subscriber('test', Positions, callback)
	    rospy.Subscriber('test', Positions, sendcommand)
	    rospy.spin()
	else:
	    land()
	    rospy.loginfo(" CTRL+C PRESSED") 
	    

def takeOff():
	rospy.sleep(15)
	pub.publish("Takeoff")	
	#rospy.Publisher('/ardrone/takeoff',Empty)

def land():
	rospy.sleep(30)
	pub.publish("Land")
	#rospy.Publisher('/ardrone/land',Empty)

def emergency():
	pub.publish("Emergency")
	#rospy.Publisher('/ardrone/reset',Empty)

# Main function.
if __name__ == '__main__':
	while not rospy.is_shutdown(): 
		rospy.init_node('single_color_tracking_reader', anonymous = True)
		takeOff()
		land()
		listener()

	land()


