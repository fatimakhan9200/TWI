clc
clear
close all

% Define possible positions
x = 0:0.1:10;
y = 0:0.1:10;

% Create a 2D grid
[X,Y] = meshgrid(x,y);

% Assume the human is actually here
true_x = 6;
true_y = 4;

% Simulate the sensing response
measurement = exp(-((X-true_x).^2 + (Y-true_y).^2) / 1.5);

% Find the strongest response
[max_value, index] = max(measurement(:));

estimated_x = X(index);
estimated_y = Y(index);

% Display result
fprintf('True X position: %.1f\n', true_x);
fprintf('True Y position: %.1f\n', true_y);

fprintf('Estimated X position: %.1f\n', estimated_x);
fprintf('Estimated Y position: %.1f\n', estimated_y);

% Display 2D measurement map
figure

imagesc(x,y,measurement)

xlabel('X Position')
ylabel('Y Position')
title('Simulated 2D Human Localization')

colorbar
axis xy