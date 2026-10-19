clc
clear
close all

% Positions along a line
position = 0:0.1:10;

% Number of sensing paths
num_paths = 4;

% Store measurements
measurements = zeros(num_paths, length(position));

% Simulate different paths
for p = 1:num_paths

    % Each path responds differently to position
    measurements(p,:) = ...
        sin(2*pi*(position/3 + p/4));
end

% Plot the measurements
figure

plot(position, measurements(1,:), 'LineWidth', 1.5)
hold on
plot(position, measurements(2,:), 'LineWidth', 1.5)
plot(position, measurements(3,:), 'LineWidth', 1.5)
plot(position, measurements(4,:), 'LineWidth', 1.5)

xlabel('Human Position')
ylabel('Measured Signal')
title('Simulated Spatial Measurements')
legend('Path 1','Path 2','Path 3','Path 4')
grid on