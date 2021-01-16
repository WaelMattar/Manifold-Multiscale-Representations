function var = Noise_measure(data)
% Measuring the variance of a noisy curve with respect to the actual curve

[m,~]       =   size(data);

% Calculating the mean of the deviations
sum = 0;
for k = 1: length(data)
    displacement    =  minimal_distance(data(k, :));
    sum             =  sum + displacement;
end
var      =  sum / m;

end