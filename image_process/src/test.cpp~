#include <ros/ros.h>
#include <stdio.h>
#include <string.h>
#include <iostream>
#include "std_msgs/String.h"
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>     //make sure to include the relevant headerfiles
#include <opencv2/highgui/highgui.hpp>
#include "opencv2/objdetect/objdetect.hpp"
#include <opencv/cv.h>
#include <opencv/highgui.h>
#include <cv_bridge/CvBridge.h>
#include <cvaux.h>
#include <math.h>
#include <cxcore.h>
#include <highgui.h>
#include <image_process/Positions.h>

/*here is a simple program which demonstrates the use of ros and opencv to do image manipulations on video streams given out as image topics from the monocular vision of robots,here the device used is a ardrone(quad-rotor).*/
 
using namespace std;
using namespace cv;
namespace enc = sensor_msgs::image_encodings;

int imagecounter = 0;
string window_name = "Capture - Face detection";
RNG rng(12345);
static const char WINDOW[] = "Image window";
CascadeClassifier face_cascade;
CascadeClassifier eyes_cascade;
//-- Note, either copy these two files from opencv/data/haarscascades to your current folder, or change these locations
  String face_cascade_name = "/home/aaroncz/OpenCV/OpenCV-2.4.2/data/haarcascades/haarcascade_frontalface_alt.xml";
  String eyes_cascade_name ="/home/aaroncz/OpenCV/OpenCV-2.4.2/data/haarcascades/haarcascade_eye_tree_eyeglasses.xml";
class drone_image
{
  ros::NodeHandle nh_;
  ros::NodeHandle n;
  ros::Publisher pub ;
  image_transport::ImageTransport it_;    
  image_transport::Subscriber image_sub_; //image subscriber 
  //image_transport::Publisher image_pub_; //image publisher(we subscribe to ardrone image_raw)
  //std_msgs::String msg;
  image_process::Positions pos_msg;
  std::vector<Rect> faces;
  Mat frame_gray;

public:
 drone_image()
    : it_(nh_)
  {
     image_sub_ = it_.subscribe("/ardrone/image_raw", 1, &drone_image::imageCb, this);
     //image_pub_= it_.advertise("/arcv/Image",1);
  }
 
  ~drone_image()
  {
    cv::destroyWindow(WINDOW);
  }
 	
  void imageCb(const sensor_msgs::ImageConstPtr& msg)
  {
 
  sensor_msgs::CvBridge bridge;//we need this object bridge for facilitating conversion from ros-img to opencv
  IplImage *img = bridge.imgMsgToCv(msg,"bgr8");  //image being converted from ros to opencv using cvbridge

  ros::Publisher chatter_pub = n.advertise<image_process::Positions>("test", 1000);   	

  Mat frame(img);
  //-- 1. Load the cascades
  if( !face_cascade.load( face_cascade_name ) ){ printf("--(!)Error loading\n"); };
  if( !eyes_cascade.load( eyes_cascade_name ) ){ printf("--(!)Error loading\n"); };

      //-- 3. Apply the classifier to the frame
      if( !frame.empty() )
       { detectAndDisplay( frame ); }
      else
       { printf(" --(!) No captured frame -- Break!");}

      int c = waitKey(10);
      if( (char)c == 'c' ) { 
	exit(0); 
	}

}

void detectAndDisplay( Mat frame )
{
   std::vector<Rect> faces;
   Mat frame_gray;

   cvtColor( frame, frame_gray, CV_BGR2GRAY );
   equalizeHist( frame_gray, frame_gray );
   //-- Detect faces
   face_cascade.detectMultiScale( frame_gray, faces, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, Size(50, 50) );
   
   printf("No face!)\n");

   for( size_t i = 0; i < faces.size(); i++ )
    {

	ostringstream os;
	os << imagecounter << " face.png";
	string name = os.str();
      imwrite( name, frame );
      //cvSaveImage(name, &(IplImage(frame)));
      imagecounter += 1;
      printf("We have a face!!)\n");
      Point center( faces[i].x + faces[i].width/2, faces[i].y + faces[i].height/2 );

      ellipse( frame, center, Size( faces[i].width/2, faces[i].height/2), 0, 0, 360, Scalar( 255, 0, 255 ), 2, 8, 0 );

      Mat faceROI = frame_gray( faces[i] );
      std::vector<Rect> eyes;

      //-- In each face, detect eyes
      eyes_cascade.detectMultiScale( faceROI, eyes, 1.1, 2, 0 |CV_HAAR_SCALE_IMAGE, Size(50, 50) );

      for( size_t j = 0; j < eyes.size(); j++ )
       {
         Point eye_center( faces[i].x + eyes[j].x + eyes[j].width/2, faces[i].y + eyes[j].y + eyes[j].height/2 );
         int radius = cvRound( (eyes[j].width + eyes[j].height)*0.25 );
         circle( frame, eye_center, radius, Scalar( 255, 0, 0 ), 3, 8, 0 );
       }
    }

   //-- Show what you got
   imshow( window_name, frame );
}
};
 
int main(int argc, char** argv)
{
  ros::init(argc, argv, "face_track");
  drone_image ic;
  ros::spin();
 
  return 0;
}
