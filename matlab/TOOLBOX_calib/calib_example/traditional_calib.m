close all;clear;

% assume a transformation from camera to Lidar
% generate simulation calibration points in lidar
Camera2LidarR = [0.08; 0.05; 0.1];
Camera2LidarT = [80.0; 70.0; 60.0];
gen_lidar_points3(Camera2LidarR, Camera2LidarT);