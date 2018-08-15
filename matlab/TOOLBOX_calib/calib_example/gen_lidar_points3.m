function lidar_points = gen_lidar_points3(Camera2LidarR, Camera2LidarT)
image_prefix = 'Image';
image_suffix = '.tif';
chessboard_prefix = 'chessboard/chessboard';
pixel_prefix = 'pixel/pixel';
lidar_prefix = 'lidar/lidar';
calib_num = length(dir('pixel')) - 2;

if ~exist('lidar', 'dir')
    mkdir('lidar')
end

show_corners = true;

% load calibration result from classic method
Calib_Results;

% transform from camera to lidar
camera_to_lidar_R = rodrigues(Camera2LidarR);
cameara_to_lidar_T = Camera2LidarT;

for i=1:calib_num
    image_file = [image_prefix num2str(i) image_suffix];
    chessboard_file = [chessboard_prefix num2str(i) '.txt'];
    pixel_file = [pixel_prefix num2str(i) '.txt'];
    lidar_file = [lidar_prefix num2str(i) '.txt'];
    
    img = imread(image_file);
    if show_corners
        imshow(img);hold on;title(['image_' num2str(i)]);
    end
    
    chessboard_points = load(chessboard_file);
    pixel_points = load(pixel_file);
    chessboard_points3 = [];
    for r=1:size(chessboard_points, 1)
        for c=1:size(chessboard_points, 2)/2
            chessboard_points3 = [chessboard_points3 [chessboard_points(r, 2*c-1); chessboard_points(r, 2*c); 0]];
            if show_corners
                plot(pixel_points(r, 2*c-1)+1, pixel_points(r, 2*c)+1, 'g+');   % +1 cause index start at 1 in matlab
            end
        end
    end
    chessboard_to_camera_R = rodrigues(eval(['omc_' num2str(i)]));
    chessboard_to_camera_T = eval(['Tc_' num2str(i)]);
    [m, n] = size(chessboard_points3);
    % transform points from chessboard to camera
    camera_points = chessboard_to_camera_R * (chessboard_points3) + repmat(chessboard_to_camera_T,[1 n]);
    % transform points from camera to lidar
    lidar_points = camera_to_lidar_R * camera_points + repmat(cameara_to_lidar_T, [1 n]);
    
    % write lidar points to disk file
    fp = fopen(lidar_file, 'w');
    for c=1:n
        for r=1:m
            fprintf(fp, '%d ', lidar_points(r, c));
        end
        fprintf(fp, '\n');
    end
    fclose(fp);
end

end