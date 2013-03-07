#include <cv.h>
#include <highgui.h>
#include <math.h>
#include "ros/ros.h"

IplImage* GetThresholdedImage(IplImage* img) {
	// Convert the image into an HSV image
	IplImage* imgHSV = cvCreateImage(cvGetSize(img), 8, 3);
	cvCvtColor(img, imgHSV, CV_BGR2HSV);

	IplImage* imgThreshed = cvCreateImage(cvGetSize(img), 8, 1);
	//Yellow
	//cvInRangeS(imgHSV, cvScalar(20, 100, 100), cvScalar(30, 255, 255),imgThreshed);

	//blue
	cvInRangeS(imgHSV, cvScalar(100, 135, 135), cvScalar(140, 255, 255), imgThreshed);
	//cvInRangeS(imgHSV, cvScalar(112, 100, 100), cvScalar(124, 255, 255), imgThreshed);


	//Red
	//cant find good color range to track

	cvReleaseImage(&imgHSV);
	return imgThreshed;
}

int main(int argc, char** argv)
{

    ros::init(argc, argv, "cointrack");
    ros::NodeHandle n;

    // Initialize capturing live feed from the camera
    CvCapture* capture = 0;
    capture = cvCaptureFromCAM(0);
    //cvNamedWindow("thresh");
    cvNamedWindow( "circles", 1 );
    int c = cvWaitKey(10);
    while(c != -1) {
	// If pressed, break out of the loop
	break;
    }
    while(ros::ok()){
    	IplImage* img = 0;
    	img = cvQueryFrame(capture);
    	//IplImage* thresh = GetThresholdedImage(img);

    	//IplImage* img = cvLoadImage("circle.jpg", 1);;
    	IplImage* gray = cvCreateImage(cvGetSize(img), 8, 1);
    	CvMemStorage* storage = cvCreateMemStorage(0);
    	cvCvtColor(img	, gray, CV_BGR2GRAY);
    	cvSmooth(gray, gray, CV_GAUSSIAN, 9, 9); 
    	CvSeq* circles = cvHoughCircles(gray, storage, CV_HOUGH_GRADIENT, 2, gray->height/4, 200, 100);
    	int i;

    	for (i = 0; i < circles->total; i++) 
    	{
    	     float* p = (float*)cvGetSeqElem( circles, i );
    	     cvCircle( img, cvPoint(cvRound(p[0]),cvRound(p[1])), 3, CV_RGB(0,255,0), -1, 8, 0 );
    	     cvCircle( img, cvPoint(cvRound(p[0]),cvRound(p[1])), cvRound(p[2]), CV_RGB(255,0,0), 3, 8, 0 );
    	}

    	cvShowImage( "circles", gray );

    }
    cvReleaseCapture(&capture);
    return 0;
}
