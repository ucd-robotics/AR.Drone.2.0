import roslib; roslib.load_manifest('image_process')
import rospy
from std_msgs.msg import String
import shlex
import tf.transformations
from image_process.msg import Positions

pub = rospy.Publisher('sendCommand',String)

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
	if msg.PosX <= isLeft:
		pub.publish("moveRight")
	elif msg.PosX >= isRight:
		pub.publish("moveLeft")
	elif msg.PosY <= isUp:
		pub.publish("moveDown")
	elif msg.PosY >= isDown:
		pub.publish("moveUp")
#need fix this line
	elif msg.PosX == 0 and msg.PosY == 0:
		pub.publish("object tracking not found")


# This ends up being the main while loop.
def listener():
    rospy.init_node('single_color_tracking_reader', anonymous = True)
    rospy.Subscriber('test', Positions, callback)
    rospy.Subscriber('test', Positions, sendcommand)
    rospy.spin()


# Main function.
if __name__ == '__main__':
    listener()
