#!/usr/bin/env python

# Import the ROS libraries, and load the manifest file which through <depend package=... /> will give us access to the project dependencies
import roslib; roslib.load_manifest('simple_control')
import rospy
from std_msgs.msg import *
from geometry_msgs.msg import Twist
from ardrone_autonomy.msg import Navdata # for receiving navdata feedback
from image_process.msg import faceInfo

#these are the Publishers that will publish messages to the drone
movement = rospy.Publisher('/cmd_vel',Twist)
pubLand = rospy.Publisher('/ardrone/land',Empty)
pubTakeoff = rospy.Publisher('/ardrone/takeoff',Empty)
pubReset = rospy.Publisher('/ardrone/reset',Empty)

# Create a callback function for the subscriber.
def callback(msg):

	if sb.height < 1800:
		rospy.loginfo(" finding face")
		rospy.loginfo(" height = [%f]" %(sb.height))
		#check if drone got increase height command
		if msg.size <= 0:
			twist.linear.x = 0; 
			twist.linear.y = 0; 
			twist.linear.z = 0.2; #move up(+)
			twist.angular.z = 0; 
			rospy.loginfo(" moving up") 

		#check if drone got decrease height command
		elif msg.size > 0: 
			land()
			rospy.Publisher('/ardrone/land',Empty)
			rospy.loginfo(" face found") 
			rospy.loginfo(" landing") 

		#this section of code should check of the tilting of the drone to try stabilize it better
		#drone tilted too much to left
		if sb.rotX > 0:
			#rospy.loginfo(" sb.rotX = [%f]" %(sb.rotX))
			twist.linear.y = 0.02; #move right(-)
		elif sb.rotX < 0:
			#rospy.loginfo(" sb.rotX = [%f]" %(sb.rotX))
			twist.linear.y = -0.02; #move left(+)
			# send commands to the drone for what movement to do	
   	elif sb.height > 1800:
		twist.linear.z = -0.2; #move down(-)

	movement.publish(twist)

# This ends up being the main while loop.
def listener():
	#on shutdown send a land command to land the drone safely
    	rospy.on_shutdown(land)
	rospy.Subscriber('face_track', faceInfo, callback)
	rospy.spin()

def land():
	rospy.loginfo(" Landing") 
	pubLand.publish(Empty())

def takeoff():
	rospy.loginfo(" Taking off") 
	pubTakeoff.publish(Empty())
	#rospy.Publisher('/ardrone/takeoff',Empty)

def emergency():
	rospy.loginfo(" Emergency") 
	pubReset.publish(Empty())

# Our controller definition to have necessary attributes
class stabilizer(object):
	def __init__(self):
		# Subscribe to the /ardrone/navdata topic, of message type navdata, and call self.ReceiveNavdata when a message is received
		self.subNavdata = rospy.Subscriber('/ardrone/navdata',Navdata,self.ReceiveNavdata) 
	
	def ReceiveNavdata(self,navdata):
		# Although there is a lot of data in this packet, only listening to rotX and state
		self.rotX = navdata.rotX
		self.state = navdata.state
		self.height = navdata.altd

# Setup the application
if __name__=='__main__':
	# Firstly we setup a ros node, so that we can communicate with the other packages
	rospy.init_node('face_find_and_land')

	# Now we construct our controller
	#controller = BasicDroneController()
	sb = stabilizer()

	takeoff()
	rospy.sleep(5)
   	# create a twist message, fill in the details
   	twist = Twist()
	twist.linear.x = 0 #move forward(+)/back (-)
	twist.linear.y = 0 #move right(-)/left(+)
	twist.linear.z = 0 #move up(+)/down(-)
	twist.angular.x = 0 #turn right(+)/left(-)
	twist.angular.y = 0  #not important 
    	twist.angular.z = 0   #not important                     

	#run the program
	listener() 
