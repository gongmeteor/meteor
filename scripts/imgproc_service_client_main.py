#! /usr/bin/env python

from meteor.srv import *
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import rospy
import cv2

if __name__ == "__main__":

    img = cv2.imread('../data/panda.jpeg')

    rospy.init_node('imgproc_service_client_main')
    # rospy.wait_for_service('image_flip')
    s = rospy.ServiceProxy('image_flip', SrvTutorial)

    req = SrvTutorialRequest()
    req.a = 1
    req.b = 2
    cvbridge = CvBridge()
    req.input = cvbridge.cv2_to_imgmsg(img, 'bgr8')

    try:
        res = s.call(req)
        rospy.loginfo("send srv, srv.Request.a and b: %ld, %ld", req.a, req.b)
        rospy.loginfo("receive srv, srv.Response.result: %ld", res.result)

        flip_img = cvbridge.imgmsg_to_cv2(res.output, 'bgr8')
        rospy.loginfo("response output image rows: %d, cols: %d", flip_img.shape[0], flip_img.shape[1])

        # Chris TODO: imshow of python-opencv often leads to unexpected errors
        cv2.namedWindow('output')
        cv2.imshow('output', flip_img)
        cv2.waitKey()
        cv2.destroyAllWindows()

        s.close()

    except rospy.ServiceException as exc:
        print("Service did not process request: " + str(exc))
