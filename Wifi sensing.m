clc
clear
close all

% Time
t = 0:0.01:10;

% Normal Wi-Fi channel
normal_signal = sin(2*pi*1*t);

% Simulated human movement
human = zeros(size(t));
human(t >= 4 & t <= 7) = 1;

% CSI changes because of human movement
csi = normal_signal + human .* 0.8 .* sin(2*pi*3*t);

% Plot
figure
plot(t,csi)
xlabel('Time (seconds)')
ylabel('CSI Amplitude')
title('Simulated Wi-Fi CSI with Human Movement')
grid on