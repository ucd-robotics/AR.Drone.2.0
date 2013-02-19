#!/usr/bin/env python

# Import the ROS libraries, and load the manifest file which through <depend package=... /> will give us access to the project dependencies
import roslib; roslib.load_manifest('simple_control')
import rospy
from std_msgs.msg import String
# Load the DroneController class, which handles interactions with the drone
from drone_controller import BasicDroneController
from std_msgs.msg import Empty       	 # for land/takeoff/emergency

#stores the command to be used and counters to see if proper loops are being hit
command  = "none"
yawLeftcounter = 0
yawRightcounter = 0
altUpcounter = 0
altDowncounter = 0

# Create a callback function for the subscriber.
def callback(data):
	global yawLeftcounter
	global yawRightcounter
	global altUpcounter
	global altDowncounter
	
	#prints the data from camera about points
#	rospy.loginfo(" command heard was: %s", data.data)

	#update what command (this command is used for the checking of what to do, eg move up/down/turn left/turn right)
	command = data.data
#	rospy.loginfo(" command is now: %s", command)

	# If we have constructed the drone controller
	if controller is not None:
		# Handle the important cases first!
		if command == checkCommand.Emergency:
			controller.SendEmergency()
		elif command == checkCommand.Takeoff:
			controller.SendTakeoff()
		elif command == checkCommand.Land:
			controller.SendLand()
		else:
			# Now we handle moving
			#check if drone got turn left command
			if command == checkCommand.YawLeft:
				#this turns left
				#tracker.yaw_velocity = -0.3
				#this makes sure the drone doesnt go up or down when turning
				tracker.z_velocity = 0
				#rospy.loginfo(" tracker's yaw amount: %f", tracker.yaw_velocity) 
				#rospy.loginfo(" tracker's atl amount: %f", tracker.z_velocity) 
				rospy.loginfo(" moving left") 

			#check if drone got turn right command
			elif command == checkCommand.YawRight:
				#this turns right
				#tracker.yaw_velocity = 0.3
				#this makes sure the drone doesnt go up or down when turning
				tracker.z_velocity = 0
				#rospy.loginfo(" tracker's yaw amount: %f", tracker.yaw_velocity) 
				#rospy.loginfo(" tracker's atl amount: %f", tracker.z_velocity) 
				rospy.loginfo(" moving right") 

			#check if drone got increase height command
			elif command == checkCommand.IncreaseAltitude:
				#this increases altitude
				tracker.z_velocity = 0.3
				#this makes sure the drone doesnt twist when increasing
				tracker.yaw_velocity = 0
				#rospy.loginfo(" tracker's yaw amount: %f", tracker.yaw_velocity) 
				#rospy.loginfo(" tracker's atl amount: %f", tracker.z_velocity) 
				rospy.loginfo(" moving up") 

			#check if drone got decrease height command
			elif command == checkCommand.DecreaseAltitude:
				#this decreases altitude
				tracker.z_velocity = -0.3
				#this makes sure the drone doesnt twist when decreasing
				tracker.yaw_velocity = 0
				#rospy.loginfo(" tracker's yaw amount: %f", tracker.yaw_velocity) 
				#rospy.loginfo(" tracker's atl amount: %f", tracker.z_velocity) 
				rospy.loginfo(" moving down") 

			#if no commands found, drone should hover
			#this works by setting all movement to 0 
			elif command == checkCommand.NoTracking:
				tracker.z_velocity = 0
				tracker.pitch = 0
				tracker.roll = 0
				tracker.yaw_velocity = 0
				rospy.loginfo(" hovering") 

			# finally we set the command to be sent. The controller handles sending this at regular intervals
			controller.SetCommand(tracker.roll, tracker.pitch, tracker.yaw_velocity, tracker.z_velocity)

# This ends up being the main while loop.
def listener():
    	rospy.on_shutdown(land)
	rospy.Subscriber('commandSent', String, callback)
	rospy.spin()

def land():
	controller.SendLand()
	rospy.Publisher('/ardrone/land',Empty)

#we define a class to check what command has come from the colour tracker node
class checkCommand(object):
	IncreaseAltitude = "moveUp"
	DecreaseAltitude = "moveDown"
	YawLeft          = "moveLeft"
	YawRight         = "moveRight"
	Takeoff          = "Takeoff"
	Land             = "Land"
	Emergency        = "Emergency"
	NoTracking	 = "object not found"

# Our controller definition to have necessary attributes
class trackController(object):
	def __init__(self):
		super(trackController,self).__init__()
		
		self.pitch = 0
		self.roll = 0
		self.yaw_velocity = 0 
		self.z_velocity = 0

# Setup the application
if __name__=='__main__':
	import signal
	import sys
	# Firstly we setup a ros node, so that we can communicate with the other packages
	rospy.init_node('tracker_controls')

	# Now we construct our controller
	controller = BasicDroneController()
	tracker = trackController()

	#run the program
	listener() 

	# and only progresses to here once the application has been shutdown
	rospy.signal_shutdown('Great Flying!')
	#sys.exit(status)