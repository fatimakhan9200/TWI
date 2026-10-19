clc
clear
close all

% Number of Wi-Fi subcarriers
num_subcarriers = 64;

% Subcarrier numbers
subcarriers = 1:num_subcarriers;

% -----------------------------
% CSI WITHOUT HUMAN MOVEMENT
% -----------------------------

csi_normal = ones(1,num_subcarriers);

% -----------------------------
% CSI WITH HUMAN MOVEMENT
% -----------------------------

% Simulated change caused by human movement
human_effect = 0.4 * sin(2*pi*subcarriers/16);

csi_human = csi_normal + human_effect;

% -----------------------------
% PLOT
% -----------------------------

figure

plot(subcarriers,csi_normal,'LineWidth',2)
hold on

plot(subcarriers,csi_human,'LineWidth',2)

xlabel('Subcarrier Number')
ylabel('CSI Amplitude')
title('Simulated Wi-Fi CSI')
legend('No Human Movement','Human Movement')
grid on