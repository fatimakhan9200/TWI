clc
clear
close all

% Define the area behind the wall
x = 0:0.1:10;
y = 0:0.1:10;

% Create a 2D grid
[X,Y] = meshgrid(x,y);

% Simulated human position
human_x = 6;
human_y = 4;

% Simulated reflected signal from the human
human_response = exp(-((X-human_x).^2 + (Y-human_y).^2) / 0.8);

% Add wall clutter
wall_clutter = 0.15 * rand(size(X));

% Add noise
noise = 0.05 * rand(size(X));

% Simulated received measurement
twi_image = human_response + wall_clutter + noise;

% Display the simulated TWI image
figure

imagesc(x,y,twi_image)

xlabel('X Position')
ylabel('Y Position')
title('Simulated Through-Wall Image')

colorbar
axis xy