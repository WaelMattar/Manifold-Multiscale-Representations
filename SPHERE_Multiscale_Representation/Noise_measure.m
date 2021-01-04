function var = Noise_measure(noisy_data)
% Measuring the variance of a noisy curve with respect to the actual curve

[m,n]       =   size(noisy_data);

if n~=3
    error('Error in dimensions!');
end

sum = 0;
for k = 1: m
    displacement    =  minimal_distance(noisy_data(k, :));
    sum             =  sum + displacement;
end

var      =  sum / m;

end