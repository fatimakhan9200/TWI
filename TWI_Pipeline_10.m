clc
clear
close all

% ==========================================
% 1. Define the area behind the wall
% ==========================================

x = 0:0.1:10;
y = 0:0.1:10;

[X,Y] = meshgrid(x,y);


% ==========================================
% 2. Define the human position
% ==========================================

human_x = 6;
human_y = 4;


% ==========================================
% 3. Simulate the human response
% ==========================================

human_response = exp( ...
    -((X-human_x).^2 + (Y-human_y).^2) / 0.8);


% ==========================================
% 4. Simulate wall attenuation
% ==========================================

wall_factor = 0.7;

after_wall = wall_factor * human_response;


% ==========================================
% 5. Simulate multipath
% ==========================================

path1 = after_wall;

path2 = 0.4 * circshift(after_wall,[2 3]);

path3 = 0.2 * circshift(after_wall,[-3 2]);

multipath_signal = path1 + path2 + path3;


% ==========================================
% 6. Add wall clutter
% ==========================================

wall_clutter = 0.15 * rand(size(X));


% ==========================================
% 7. Add noise
% ==========================================

noise = 0.05 * rand(size(X));


% ==========================================
% 8. Received signal
% ==========================================

received_signal = multipath_signal ...
    + wall_clutter ...
    + noise;


% ==========================================
% 9. Normalize the result
% ==========================================

twi_image = received_signal / max(received_signal(:));


% ==========================================
% 10. Display final TWI result
% ==========================================

figure

imagesc(x,y,twi_image)

xlabel('X Position')
ylabel('Y Position')

title('Complete Simulated Through-Wall Imaging Pipeline')

colorbar
axis xy