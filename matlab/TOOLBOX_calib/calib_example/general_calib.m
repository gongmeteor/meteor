close all;clear;

planar_calib_init = false;
generate_data = false;
compute_extrinsic_init = true;

% init planar calibration as if you don't have accurate 3D coordinates 
% of chessboard pattern points, this can provide fairly good init guess
% about camera intrinsic parameters, and can be compared with general
% calibration results for further analysis
if planar_calib_init
    planar_calib();
end

% assume a transformation from camera to Lidar
% generate simulation calibration points in lidar
if generate_data
    Camera2LidarR = [0.5; 0.3; 0.2];
    Camera2LidarT = [80.; 70.0; 60.0];
    gen_lidar_points3(Camera2LidarR, Camera2LidarT);
end

% compute init extrinsic parameters
if compute_extrinsic_init
    [omckk,Tckk,Rckk,JJ] = compute_extrinsic_general();
end



