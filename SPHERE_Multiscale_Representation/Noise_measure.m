function var = Noise_measure(noisy_data)
% Measuring the variance of a noisy curve with respect to the actual curve

[m,n]       =   size(noisy_data);

if n~=3
    error('Error in dimensions!');
end

noise_free  =   SPHERE_build_curve(m);

sum = 0;
for k = 1: m
    noise    =  SPHERE_Log(noise_free(k, :), noisy_data(k, :));
    sum      =  sum + norm(noise, 2)^2;
end

var      =  sum / m;

end