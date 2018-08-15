function go_general_calib_optim()

% read lidar and pixel points
[x_1, X_1] = read_pixel_lidar_points();

% read init param for general calib optim
% Compute_Extrinsic_Init_Results;

% in general calibration, all calib points share one common extrinsic parameter
% therefor belong to one (3D) image
n_ima = 1;
fc = [650.0; 650];      % must give a resonable value, or will fall into ill condition

% optimize
go_calib_optim;

saving_general_calib('General_Calib_Result.m', omc_1, Tc_1, fc, cc, kc, alpha_c, err_std);
    
end