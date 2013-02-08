#!/usr/bin/env python
import roslib; roslib.load_manifest('ardrone_tutorials_getting_started')
import rospy
from std_msgs.msg import Empty       	 # for land/takeoff/emergency


def land():
	rospy.Publisher('/ardrone/land',Empty)

# Main function.
if __name__ == '__main__':
	rospy.init_node('land', anonymous = True)
	land()
