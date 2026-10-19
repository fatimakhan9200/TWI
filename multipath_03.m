clc
clear
close all

% Time
t = 0:0.01:10;

% Original signal
signal = sin(2*pi*1*t);

% Different propagation paths
path1 = signal;
path2 = 0.5 * sin(2*pi*1*t + pi/4);
path3 = 0.3 * sin(2*pi*1*t + pi/2);

% Signals arriving through different paths
multipath_signal = path1 + path2 + path3;

% Plot the multipath signal
figure
plot(t, multipath_signal)

xlabel('Time (seconds)')
ylabel('Amplitude')
title('Simulated Multipath Signal')
grid on