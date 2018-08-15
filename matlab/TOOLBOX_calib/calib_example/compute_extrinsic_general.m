function [omckk,Tckk,Rckk,JJ] = compute_extrinsic_general()

pixel_prefix = 'pixel/pixel';
lidar_prefix = 'lidar/lidar';
calib_num = length(dir('pixel')) - 2;
compute_extrinsic_save_file = 'Compute_Extrinsic_Init_Results.m';

% read lidar and pixel points
pixel_points = [];
lidar_points = [];
for i=1:calib_num
    pixel_file = [pixel_prefix num2str(i) '.txt'];
    lidar_file = [lidar_prefix num2str(i) '.txt'];
    
    pixels = load(pixel_file);
    [nRows, nCols] = size(pixels);
    for r=1:nRows
        for c=1:nCols/2
            pixel_points = [pixel_points [pixels(r, 2*c-1); pixels(r, 2*c)]];
        end
    end
    lidar_points = [lidar_points load(lidar_file)'];
end

% compute extrinsic init
% init camera intrinsic by planar calib result
Calib_Results;

[omckk_init, Tckk_init, Rckk_init] = compute_extrinsic_init(pixel_points, lidar_points, fc, cc, kc,alpha_c);
[omckk,Tckk,Rckk,JJ] = compute_extrinsic_refine(omckk_init, Tckk_init, pixel_points, lidar_points, fc, cc, kc,alpha_c);

% save compute extrinsic results
saving_general_calib(compute_extrinsic_save_file, omckk, Tckk, fc, cc, kc, alpha_c);

end

