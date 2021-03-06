#!/usr/bin/env python

# Import the ROS libraries, and load the manifest file which through <depend package=... /> will give us access to the project dependencies
import roslib; roslib.load_manifest('simple_control')
import rospy
from std_msgs.msg import *
#from std_msgs.msg import Empty       	 # for land/takeoff/emergency
from geometry_msgs.msg import Twist
from ardrone_autonomy.msg import Navdata # for receiving navdata feedback


#stores the command to be used and counters to see if proper loops are being hit
command  = "none"
yawLeftcounter = 0
yawRightcounter = 0
altUpcounter = 0
altDowncounter = 0

#these are the Publishers that will publish messages to the drone
movement = rospy.Publisher('/cmd_vel',Twist)
pubLand = rospy.Publisher('/ardrone/land',Empty)
pubTakeoff = rospy.Publisher('/ardrone/takeoff',Empty)
pubReset = rospy.Publisher('/ardrone/reset',Empty)

# Create a callback function for the subscriber.
def callback(data):
	global yawLeftcounter
	global yawRightcounter
	global altUpcounter
	global altDowncounter

	#update what command (this command is used for the checking of what to do, eg move up/down/turn left/turn right)
	command = data.data
	#if sb.state == 4 or sb.state == 5:

	# Handle the important cases first!
	if command == checkCommand.Emergency:
		emergency()
	elif command == checkCommand.Takeoff:
		takeoff()
	elif command == checkCommand.Land:
		land()
	else:
		# Now we handle moving
		#check if drone got turn left command
		if command == checkCommand.YawLeft:
			twist.linear.x = 0; 
			twist.linear.y = 0; 
			twist.linear.z = 0;
			twist.angular.z = -0.3; #turn left(-)
			rospy.loginfo(" moving left") 

		#check if drone got turn right command
		elif command == checkCommand.YawRight:
			twist.linear.x = 0; 
			twist.linear.y = 0;
			twist.linear.z = 0; 
			twist.angular.z = 0.3; #turn right(+)
			rospy.loginfo(" moving right") 

		#check if drone got increase height command
		elif command == checkCommand.IncreaseAltitude:
			twist.linear.x = 0; 
			twist.linear.y = 0; 
			twist.linear.z = 0.3; #move up(+)
			twist.angular.z = 0; 
			rospy.loginfo(" moving up") 

		#check if drone got decrease height command
		elif command == checkCommand.DecreaseAltitude:
			twist.linear.x = 0; 
			twist.linear.y = 0; 
			twist.linear.z = -0.3; #move down(-)
			twist.angular.z = 0;
			rospy.loginfo(" moving down") 

		#check if drone got decrease height command
		elif command == checkCommand.DecreaseAltitude:
			twist.linear.x = -0.3; #move back(-)
			twist.linear.y = 0; 
			twist.linear.z = 0; 
			twist.angular.z = 0;
			rospy.loginfo(" moving backwards") 
		#check if drone got decrease height command
		elif command == checkCommand.DecreaseAltitude:
			twist.linear.x = 0.3; #move forward (+)
			twist.linear.y = 0; 
			twist.linear.z = 0; 
			twist.angular.z = 0;
			rospy.loginfo(" moving forwards") 

		#if no commands found, drone should hover
		#this works by setting all movement to 0 
		elif command == checkCommand.NoTracking:
			twist.linear.x = 0; 
			twist.linear.y = 0; 
			twist.linear.z = 0; 
			twist.angular.z = 0;
			rospy.loginfo(" hovering") 
		
	#this section of code should check of the tilting of the drone to try stabilize it better
		#drone tilted too much to left
		if sb.rotX > 0:
			#rospy.loginfo(" sb.rotX = [%f]" %(sb.rotX))
			twist.linear.y = 0.02; #move right(-)
		elif sb.rotX < 0:
			#rospy.loginfo(" sb.rotX = [%f]" %(sb.rotX))
			twist.linear.y = -0.02; #move left(+)

		# send commands to the drone for what movement to do	
	   	movement.publish(twist)

# This ends up being the main while loop.
def listener():
	#on shutdown send a land command to land the drone safely
    	rospy.on_shutdown(land)
	rospy.Subscriber('commandSent', String, callback)
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

def handle_empty(req):
    rospy.loginfo("Flat trim sent")
    #return EmptySrvResponse()

#we define a class to check what command has come from the colour tracker node
class checkCommand(object):
	PitchForward     = "moveForward"
	PitchBackward    = "moveBackward"
	IncreaseAltitude = "moveUp"
	DecreaseAltitude = "moveDown"
	YawLeft          = "moveLeft"
	YawRight         = "moveRight"
	Takeoff          = "Takeoff"
	Land             = "Land"
	Emergency        = "Emergency"
	NoTracking	 = "object not found"

# Our controller definition to have necessary attributes
class stabilizer(object):
	def __init__(self):
		# Subscribe to the /ardrone/navdata topic, of message type navdata, and call self.ReceiveNavdata when a message is received
		self.subNavdata = rospy.Subscriber('/ardrone/navdata',Navdata,self.ReceiveNavdata) 
	
	def ReceiveNavdata(self,navdata):
		# Although there is a lot of data in this packet, only listening to rotX and state
		self.rotX = navdata.rotX
		self.state = navdata.state

# Setup the application
if __name__=='__main__':
	import signal
	import sys
	# Firstly we setup a ros node, so that we can communicate with the other packages
	rospy.init_node('tracker_controls')

	#send empty Sercive call to flat trim to stabilize drone before take off
	#rospy.Service('/ardrone/flattrim', Empty, handle_empty)
	
	# Now we construct our controller
	#controller = BasicDroneController()
	sb = stabilizer()

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

