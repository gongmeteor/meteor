#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <meteor/SrvTutorial.h>
#include <meteor/testlibcall.h>

int main(int argc, char** argv)
{
    // test lib call
    int a = 1, b = 1;
    int c = addTwoInts(a, b);

    cv::Mat img = cv::imread("src/meteor/data/panda.jpeg");
    sensor_msgs::ImagePtr im_msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", img).toImageMsg();

    ros::init(argc, argv, "imgproc_service_client_main");
    ros::NodeHandle nh;
    ros::ServiceClient client = nh.serviceClient<meteor::SrvTutorial>("image_flip");
    meteor::SrvTutorial srv;
    srv.request.a = 1;
    srv.request.b = 2;
    srv.request.input = *im_msg;

    if(client.call(srv))
    {
        ROS_INFO("send srv, srv.Request.a and b: %ld, %ld", (long int)srv.request.a, (long int)srv.request.b);
        ROS_INFO("receive srv, srv.Response.result: %ld", (long int)srv.response.result);

        cv_bridge::CvImagePtr output_ptr = cv_bridge::toCvCopy(srv.response.output, "bgr8");
        cv::namedWindow("output");
        cv::imshow("output", output_ptr->image);
        cv::waitKey();
    }
    else
    {
        ROS_ERROR("fail to call service image_flip");
        return 1;
    }

    return 0;
}
