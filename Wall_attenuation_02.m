clc
clear
close all

% Time
t = 0:0.01:10;

% Original Wi-Fi signal
tx_signal = sin(2*pi*1*t);

% ------------------------------------------------
% WALL
% ------------------------------------------------

% Wall attenuation
wall_factor = 0.6;

% Signal after passing through wall
after_wall = wall_factor * tx_signal;

% ------------------------------------------------
% HUMAN MOVEMENT
% ------------------------------------------------

human = zeros(size(t));

% Human moves from 4 to 7 seconds
human(t >= 4 & t <= 7) = 1;

% Human changes the received signal
human_effect = human .* 0.5 .* sin(2*pi*3*t);

% ------------------------------------------------
% RECEIVED SIGNAL
% ------------------------------------------------

received_signal = after_wall + human_effect;

% ------------------------------------------------
% NOISE
% ------------------------------------------------

noise = 0.2 * randn(size(t));

received_signal = received_signal + noise;

% ------------------------------------------------
% PLOT
% ------------------------------------------------

figure

plot(t, received_signal)

xlabel('Time (seconds)')
ylabel('Signal Amplitude')
title('Simulated Wi-Fi Signal Through a Wall')
grid on