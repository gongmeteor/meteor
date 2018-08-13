#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <meteor/SrvTutorial.h>


bool image_flip(meteor::SrvTutorial::Request &req, meteor::SrvTutorial::Response &res)
{
    res.result = req.a + req.b;

    ROS_INFO("request: a=%ld, b=%ld", (long int)req.a, (long int)req.b);
    ROS_INFO("sending back response: %d", (long int)res.result);

    cv_bridge::CvImagePtr input_ptr = cv_bridge::toCvCopy(req.input, "bgr8");
    cv::namedWindow("service");
    cv::imshow("service", input_ptr->image);
    cv::waitKey();
    cv::destroyAllWindows();

    cv::Mat flip_img;
    cv::flip(input_ptr->image, flip_img, 0);
    sensor_msgs::ImagePtr im_msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", flip_img).toImageMsg();

    res.output = *im_msg;

    return true;
}


int main(int argc, char** argv)
{
    ros::init(argc, argv, "imgproc_service_server_assist");
    ros::NodeHandle nh;
    ros::ServiceServer server = nh.advertiseService("image_flip", image_flip);

    ROS_INFO("image_flip service ready!");
    ros::spin();

    return 0;
}