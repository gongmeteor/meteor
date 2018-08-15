function planar_calib()

calib_name = 'Image';
format_image = 'tif';
chessboard_prefix = 'chessboard/chessboard';
pixel_prefix = 'pixel/pixel';
calib_num = length(dir('pixel')) - 2;

for i=1:calib_num
    chessboard_file = [chessboard_prefix num2str(i) '.txt'];
    pixel_file = [pixel_prefix num2str(i) '.txt'];
    
    pixel_points = load(pixel_file);
    pixel_points2 = [];
    chessboard_points = load(chessboard_file);
    chessboard_points3 = [];
    for r=1:size(chessboard_points, 1)
        for c=1:size(chessboard_points, 2)/2
            pixel_points2 = [pixel_points2 [pixel_points(r, 2*c-1); pixel_points(r, 2*c)]];
            chessboard_points3 = [chessboard_points3 [chessboard_points(r, 2*c-1); chessboard_points(r, 2*c); 0]];
        end
    end
    eval(['x_' num2str(i) '=pixel_points2']);
    eval(['X_' num2str(i) '=chessboard_points3']);
end

% Loads the images:
ima_read_calib;
% Set the toolbox not to prompt the user (choose default values)
dont_ask = 1;
% Run the main calibration routine:
go_calib_optim;
% Shows the extrinsic parameters:
ext_calib;
% Reprojection on the original images:
reproject_calib;
% Saves the results into a file called Calib_Results.mat:
saving_calib;
% Set the toolbox to normal mode of operation again:
dont_ask =  0;

end