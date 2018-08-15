function [pixel_points, lidar_points] = read_pixel_lidar_points()

pixel_prefix = 'pixel/pixel';
lidar_prefix = 'lidar/lidar';
calib_num = length(dir('pixel')) - 2;

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

end