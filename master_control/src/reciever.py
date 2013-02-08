#!/usr/bin/env python
import roslib; roslib.load_manifest('image_process')
import rospy
from std_msgs.msg import String

# Create a callback function for the subscriber.
def callback(msg):
#prints the data from camera about points
    rospy.loginfo(" I heard %s", msg)
    #rospy.loginfo(" recieved: %s",data.data)    

# This ends up being the main while loop.
def listener():
    rospy.init_node('listener', anonymous = True)
    rospy.Subscriber('commandSent', String, callback)
    rospy.spin()


# Main function.
if __name__ == '__main__':
    listener()
