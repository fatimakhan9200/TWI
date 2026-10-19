clc
clear
close all

% Time
t = 0:0.05:10;

% Number of Wi-Fi subcarriers
num_subcarriers = 64;

% Create a CSI matrix
CSI = zeros(num_subcarriers, length(t));

% Simulate CSI for each subcarrier
for sc = 1:num_subcarriers

    % Normal channel response
    normal = 1;

    % Simulated human movement
    human_effect = 0.4 * sin(2*pi*(0.2 + sc/200)*t);

    % CSI changes with time
    CSI(sc,:) = normal + human_effect;

end

% Display CSI as an image
figure

imagesc(t, 1:num_subcarriers, CSI)

xlabel('Time (seconds)')
ylabel('Subcarrier Number')
title('Simulated CSI Changes Over Time')
colorbar