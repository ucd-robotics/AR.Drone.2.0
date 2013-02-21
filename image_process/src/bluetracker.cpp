#include "cv.h"
#include "highgui.h"
#include "cxcore.h"
#include "ros/ros.h"
#include <image_process/Positions.h>

IplImage* Threshold(IplImage* src)
{

	IplImage* srcHSV = cvCreateImage(cvGetSize(src), 8, 3);//get size of the "src" and asign same parameters to srcHSV

	cvCvtColor(src, srcHSV, CV_BGR2HSV);// Convert the src into an HSV image

	IplImage* Thresholdimg = cvCreateImage(cvGetSize(src), 8, 1); //get size of the "src" and asign same parameters to Thresholdimg

	// Change cvScalar values in the order of desired H(hue),S(saturation),V(value) . now its blue color to threshold
	//cvInRangeS(srcHSV, cvScalar(112, 100, 100), cvScalar(124, 255, 255), Thresholdimg);
	cvInRangeS(srcHSV, cvScalar(100, 135, 135), cvScalar(140, 255, 255), Thresholdimg);
	cvReleaseImage(&srcHSV);

	return Thresholdimg;
}

int main(int argc, char** argv)
{
	ros::init(argc, argv, "bluetracker");
	ros::NodeHandle n;
	image_process::Positions pos_msg;

	CvCapture* capture = 0;
	capture = cvCaptureFromCAM(0);// capturing from the camera

	// If there is no camera or some error	
	if(!capture)
	    {
	        printf("Can not capture,no device found\n");
	        return -1;
	    }

	// create windows to show the video.
	cvNamedWindow("Tracking output");
	cvNamedWindow("Threshold");

	while(ros::ok())
	{

		IplImage* frame = 0;
		frame = cvQueryFrame(capture);

		// if there is no frame then break
    		if(!frame)
            		break;

		// Holds the Thresholded image
  		IplImage* finalthreshold = Threshold(frame);
  		cvShowImage("Threshold", finalthreshold);//show the thresholded image
  		CvMemStorage*  storage  = cvCreateMemStorage(0);// allocate memory to store the contour information
  		CvSeq* contours = 0;// list contains contours.
 		cvFindContours( finalthreshold, storage, &contours );// built in function to find contours
 		if( contours )
   			 cvDrawContours(frame,contours,CV_RGB(255,0,0),CV_RGB(255,0,0),100,5);// draw contours in red color.
	
		cvShowImage("Tracking output", frame);

		// Wait for a keypress
		int c = cvWaitKey(27);
		if(c!=-1)
  			break;

		// Release the thresholded image.
		cvReleaseImage(&finalthreshold);

    }

    // Release the capture
    cvReleaseCapture(&capture);
    return 0;
}
