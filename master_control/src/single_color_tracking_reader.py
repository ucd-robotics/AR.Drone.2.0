import roslib; roslib.load_manifest('image_process')
import rospy
from std_msgs.msg import String
import shlex
import tf.transformations
from geometry_msgs.msg import Twist
from image_process.msg import Positions

#need to get working to split string
def splitString(data):
	point = data
	points = point.split()
	global x,y
	X = points[0]
	y = points[1]


# Create a callback function for the subscriber.
def callback(msg):
#prints the data from camera about points
    #rospy.loginfo(" I heard %s", msg)
    #splitString(data)
    rospy.loginfo(" Point x:[%f]" %(msg.PosX))    
    rospy.loginfo(" Point y:[%f]" %(msg.PosY))    
    #rospy.loginfo("Linear Components: [%f, %f]"%(msg.linear.x, msg.linear.y))


# This ends up being the main while loop.
def listener():
    rospy.init_node('single_color_tracking_reader', anonymous = True)
    rospy.Subscriber('test', Positions, callback)
    rospy.spin()


# Main function.
if __name__ == '__main__':
    listener()
