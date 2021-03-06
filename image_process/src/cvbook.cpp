
#include "ros/ros.h"
#include "cv.h"
#include <opencv2/core/core.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>


int main()
{
// Open the video file
	CvCapture* capture = 0;
	capture = cvCaptureFromCAM(0);

// check if video successfully opened
if (!capture.isOpened()){
printf("--(!)Error loading\n");
return 1;
}
// Get the frame rate
double rate= capture.get(CV_CAP_PROP_FPS);
bool stop(false);
cv::Mat frame; // current video frame
cv::namedWindow("Extracted Frame");
// Delay between each frame in ms
// corresponds to video frame rate
int delay= 1000/rate;
// for all frames in video
while (!stop) {
// read next frame if any
if (!capture.read(frame))
break;
cv::imshow("Extracted Frame",frame);
// introduce a delay
// or press key to stop
if (cv::waitKey(delay)>=0)
stop= true;
}
// Close the video file.
// Not required since called by destructor
capture.release();
}

