#include &lt;cv.h&gt;
#include &lt;highgui.h&gt;
// Camera.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
int main()
{
    CvCapture* capture = 0;
    capture = cvCaptureFromCAM(0);

    if(!capture)
    {
        printf("Could not initialize capturing...\n");
        return -1;
    }
 
    cvNamedWindow("video");
	
    while(true)
    {
	 frame = cvQueryFrame(capture);
 
         if(!frame)
             break;
         cvShowImage("video", frame);
         int c = cvWaitKey(20);
         if((char)c==27 )
            break;
    }
    cvReleaseCapture(&amp;capture);
    return 0;
}
