import cv2
import os
import numpy as np

lidar_path = '../../data/calib/lidar'
lidar_files = sorted(os.listdir(lidar_path))
pixel_path = '../../data/calib/pixel'
pixel_files = sorted(os.listdir(pixel_path))

lidar_points_all = []
pixel_points_all = []
for i in range(len(lidar_files)):
    lidar_file = os.path.join(lidar_path, lidar_files[i])
    pixel_file = os.path.join(pixel_path, pixel_files[i])

    lidar_points_file = np.loadtxt(lidar_file)
    pixel_points_file = np.loadtxt(pixel_file)
    pixel_points_file = pixel_points_file.reshape((-1, 2))

    if i == 0:
        lidar_points_all = lidar_points_file
        pixel_points_all = pixel_points_file
    else:
        lidar_points_all = np.concatenate((lidar_points_all, lidar_points_file), axis=0)
        pixel_points_all = np.concatenate((pixel_points_all, pixel_points_file), axis=0)

lidar_points_all = lidar_points_all.reshape(-1, 3)
lidar_points_all = pixel_points_all.reshape(-1, 2)
object_points = []
image_points = []
object_points.append(lidar_points_all)
image_points.append(pixel_points_all)

init_camera_matrix = np.float64([[650, 0, 320], [0, 650, 240], [0, 0, 1]])
ret, mtx, dist, rvecs, tvecs = cv2.calibrateCamera(object_points, image_points, (640, 320), init_camera_matrix, None)

a = 1
