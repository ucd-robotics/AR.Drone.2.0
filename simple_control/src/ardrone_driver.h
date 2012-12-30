#ifndef _ARDRONE_DRIVER_H_
#define _ARDRONE_DRIVER_H_

#include <ros/ros.h>

class ARDroneDriver
{
public:
        ARDroneDriver();
        ~ARDroneDriver();

        void run();

private:
        void publish_video();
        void publish_navdata();

        ros::NodeHandle node_handle;
        ros::Subscriber cmd_vel_sub;
        ros::Subscriber takeoff_sub;
        ros::Subscriber reset_sub;
        ros::Subscriber land_sub;
        ros::Publisher navdata_pub;

        int last_frame_id;
        int flying_state;
};

#endif

