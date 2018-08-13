#! /usr/bin/env python

from meteor.srv import *
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import rospy
import cv2
import torch

def image_flip(req):
    res = SrvTutorialResponse()
    res.result = req.a + req.b
    rospy.loginfo("request: a=%ld, b=%ld", req.a, req.b)
    rospy.loginfo("sending back response: %d", res.result)

    cvbridge = CvBridge()
    cv_image_input = cvbridge.imgmsg_to_cv2(req.input, 'bgr8')
    rospy.loginfo("request input image rows: %d, cols: %d", cv_image_input.shape[0], cv_image_input.shape[1])
    
    # Chris TODO: imshow of python-opencv often leads to unexpected errors
    cv2.namedWindow('service')
    cv2.imshow('service', cv_image_input)
    cv2.waitKey()
    cv2.destroyAllWindows()

    cv_image_flip = cv2.flip(cv_image_input, 0)
    res.output = cvbridge.cv2_to_imgmsg(cv_image_flip, 'bgr8')
    
    return res

def imgproc_service_server_assist():
    rospy.init_node('imgproc_service_server_assist')
    s = rospy.Service('image_flip', SrvTutorial, image_flip)

    rospy.loginfo("image_flip service ready!")
    rospy.spin()

if __name__ == "__main__":
    imgproc_service_server_assist()

