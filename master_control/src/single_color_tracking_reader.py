import roslib; roslib.load_manifest('image_process')
import rospy
from std_msgs.msg import String
import shlex


#need to get working to split string
def splitString(data):
	point = data
	points = point.split()
	global x,y
	X = points[0]
	y = points[1]


# Create a callback function for the subscriber.
def callback(data):
#prints the data from camera about points
    rospy.loginfo(" I heard %s", data)
    #splitString(data)
    #rospy.loginfo(rospy.get_name() + " Point x:", x)    
    #rospy.loginfo(rospy.get_name() + " Point y:", y)


# This ends up being the main while loop.
def listener():
    rospy.init_node('single_color_tracking_reader', anonymous = True)
    rospy.Subscriber('test', String, callback)
    rospy.spin()


# Main function.
if __name__ == '__main__':
    listener()
