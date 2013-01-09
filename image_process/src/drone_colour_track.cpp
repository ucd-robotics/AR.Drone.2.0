#include <ros/ros.h>
#include <stdio.h>
#include <iostream>
#include "std_msgs/String.h"
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>     //make sure to include the relevant headerfiles
#include <opencv2/highgui/highgui.hpp>
#include <opencv/cv.h>
#include <opencv/highgui.h>
#include <cv_bridge/CvBridge.h>
#include <cvaux.h>
#include <math.h>
#include <cxcore.h>
#include <highgui.h>
 
#define IMGDATA(image,i,j,k) *((uchar *)&image->imageData[(i)*(image->widthStep) + (j)*(image->nChannels) + (k)]) //extracts pixel information

#define TOLH 5
#define TOLS 100
#define TOLV 150

/*here is a simple program which demonstrates the use of ros and opencv to do image manipulations on video streams given out as image topics from the monocular vision of robots,here the device used is a ardrone(quad-rotor).*/
 
using namespace std;
using namespace cv;
namespace enc = sensor_msgs::image_encodings;
 
static const char WINDOW[] = "Image window";

class drone_image
{
  ros::NodeHandle nh_;
  ros::NodeHandle n;
  ros::Publisher pub ;
  image_transport::ImageTransport it_;    
  image_transport::Subscriber image_sub_; //image subscriber 
  image_transport::Publisher image_pub_; //image publisher(we subscribe to ardrone image_raw)
  std_msgs::String msg;
public:
 drone_image()
    : it_(nh_)
  {
     image_sub_ = it_.subscribe("/ardrone/image_raw", 1, &drone_image::imageCb, this);
     image_pub_= it_.advertise("/arcv/Image",1);
  }
 
  ~drone_image()
  {
    cv::destroyWindow(WINDOW);
  }
 	
  void imageCb(const sensor_msgs::ImageConstPtr& msg)
  {
 
     sensor_msgs::CvBridge bridge;//we need this object bridge for facilitating conversion from ros-img to opencv
	IplImage* img = bridge.imgMsgToCv(msg,"bgr8");  //image being converted from ros to opencv using cvbridge
//      IplImage* out1 = cvCreateImage( cvGetSize(img), 8, 3 );   //make sure to feed the image(img) data to the parameters necessary for canny edge output 

//testing code
//int min_thresh = 50;
//int max_thresh = 250;
//IplImage* workingImage = colour_detect_RGB(img, min_thresh, max_thresh); //works but pics up a lot
//IplImage* workingImage = GetThresholdedImage(img); // shows yellow from cam 


	IplImage* result = cvCreateImage( cvGetSize(img), 8, 3 );
	// The two windows we'll be using
	cvNamedWindow("video");
	cvNamedWindow("thresh");

	// This image holds the "scribble" data...
	// the tracked positions of the ball
	IplImage* imgScribble = NULL;

	// If this is the first frame, we need to initialize it
	if (imgScribble == NULL) {
		imgScribble = cvCreateImage(cvGetSize(img), 8, 3);
	}

	// Holds the yellow thresholded image (yellow = white, rest = black)
	IplImage* imgYellowThresh = GetThresholdedImage(img);

	// Calculate the moments to estimate the position of the ball
	CvMoments *moments = (CvMoments*) malloc(sizeof(CvMoments));
	cvMoments(imgYellowThresh, moments, 1);

	// The actual moment values
	double moment10 = cvGetSpatialMoment(moments, 1, 0);
	double moment01 = cvGetSpatialMoment(moments, 0, 1);
	double area = cvGetCentralMoment(moments, 0, 0);

	// Holding the last and current ball positions
	static int posX = 0;
	static int posY = 0;

	int lastX = posX;
	int lastY = posY;

	posX = moment10 / area;
	posY = moment01 / area;

	// Print it out for debugging purposes
	printf("position (%d,%d)\n", posX, posY);

	// We want to draw a line only if its a valid position
	if (lastX > 0 && lastY > 0 && posX > 0 && posY > 0) {
		// Draw a yellow line from the previous point to the current point
		cvLine(imgScribble, cvPoint(posX, posY), cvPoint(lastX, lastY),
				cvScalar(100, 170, 170), 5);
	}

	// Add the scribbling image and the frame...
	cvAdd(img, imgScribble, result, NULL);
	cvShowImage("thresh", imgYellowThresh);
	cvShowImage("result", result);
        cvShowImage( "ARDRONE FEED",img);

	// Wait for a keypress
	int c = cvWaitKey(10);
	if (c != -1) {
		// If pressed, break out of the loop
		exit(0);
	}
}

IplImage* colour_detect_RGB(IplImage* img,int min_thresh, int max_thresh)
{
     IplImage* result;
     int i,j,ht,wd;
     ht = img->height;
     wd = img->width;
     result = cvCreateImage(cvSize(wd,ht),IPL_DEPTH_8U,1); //The result is initialized

     for(i=0;i<ht;i++)
     {
	for(j=0;j<wd;j++)
	{
		//The condition is enforced for the values of each channel as described
		if(IMGDATA(img,i,j,2)>min_thresh && IMGDATA(img,i,j,1)<max_thresh && IMGDATA(img,i,j,0)<max_thresh )
			IMGDATA(result,i,j,0) = 255; //The necessary pixels are made white
		else
			IMGDATA(result,i,j,0) = 0; //The other pixels are made black
	}
     }
	return result;
}

IplImage* GetThresholdedImage(IplImage* img) {
	// Convert the image into an HSV image
	IplImage* imgHSV = cvCreateImage(cvGetSize(img), 8, 3);
	cvCvtColor(img, imgHSV, CV_BGR2HSV);

	IplImage* imgThreshed = cvCreateImage(cvGetSize(img), 8, 1);

	//Yellow
	//cvInRangeS(imgHSV, cvScalar(20, 100, 100), cvScalar(30, 255, 255),imgThreshed);

	//blue
	cvInRangeS(imgHSV, cvScalar(100, 135, 135), cvScalar(140, 255, 255), imgThreshed);

	//Red
	//cant find good color range to track

	cvReleaseImage(&imgHSV);
	return imgThreshed;
}

};
 
int main(int argc, char** argv)
{
  ros::init(argc, argv, "drone_image");
  drone_image ic;
  ros::spin();
 
  return 0;
}
