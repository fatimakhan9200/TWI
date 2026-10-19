clc
clear
close all

% Possible human positions
position = 0:0.1:10;

% Assume the human is actually here
true_position = 6;

% Number of sensing paths
num_paths = 4;

% Store measurements
measurements = zeros(num_paths, length(position));

% Generate measurements for each path
for p = 1:num_paths

    measurements(p,:) = ...
        exp(-((position - true_position).^2) / (0.5 + p*0.2));

end

% Combine measurements from all paths
combined_measurement = sum(measurements, 1);

% Find the position with the strongest combined response
[~, index] = max(combined_measurement);

estimated_position = position(index);

% Display result
fprintf('True human position: %.1f\n', true_position);
fprintf('Estimated human position: %.1f\n', estimated_position);

% Plot
figure

plot(position, combined_measurement, 'LineWidth', 2)
hold on

plot(true_position, combined_measurement(position == true_position), ...
    'o', 'MarkerSize', 8)

plot(estimated_position, combined_measurement(index), ...
    'x', 'MarkerSize', 10, 'LineWidth', 2)

xlabel('Human Position')
ylabel('Combined Measurement')
title('Simple Human Localization')
legend('Combined Measurements', 'True Position', 'Estimated Position')
grid on