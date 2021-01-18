
clear;
close all;

% Sampling the curve
n             =  6;
points        =  SPHERE_build_curve(10*2^(n-1)+1);

% Workspace
range         =  linspace(1,n - 1, n - 1);
norms         =  zeros(n - 1, 1);

% Generating 2-dimensional normally distributed noise
mu            =  zeros(1, 2);
Sigma         =  1/7000 * eye(2);
rng('default');
XY            =  mvnrnd(mu, Sigma, length(points));
Z             =  points(:,3).^(-1) .* (-XY(:,1).*points(:,1) - XY(:,2).*points(:,2));
Noise         =  horzcat(XY, Z);

% Projecting the noise into the sphere
Noisy_data    =  points;
for k = 1: length(points)
   Noisy_data(k, :)    =  SPHERE_Exp(points(k, :), Noise(k, :));
end

% Multiscale transform on noisy data
pyramid       =  SPHERE_pyramid(Noisy_data, n);

% Noise filtering
for k = 2: n
    pyramid{k} = Noise_shrink(pyramid{k}, 0.14);
end

% Reconstruction
denoised                  =   pyramid{1};
for k = 2: n
   denoised  =  SPHERE_reconstruct(denoised, pyramid{k}); 
end

% Connecting geodesics
geodesics = Noisy_data;
for k = 1: 2
    geodesics = SPHERE_DD0_refine(geodesics);
end

% Measuring the noise
pre_denoising  = Noise_measure(geodesics);
post_denoising = Noise_measure(denoised);

% Demonstrations
figure(1); hold on;
SPHERE_plot(geodesics);
fpath = 'D:\Git_Projects\Manifold-Multiscale-Representations\SPHERE_Multiscale_Representation\Generated_Images';
saveas(gcf,fullfile(fpath, 'sphere_noisy_points'),'fig');
fprintf('Noisy curve std: %f\n', pre_denoising);
hold off;

figure(2); hold on;
SPHERE_plot(denoised);
saveas(gcf,fullfile(fpath, 'sphere_denoised_points'),'fig');
fprintf('Denoised curve std: %f\n', post_denoising);
hold off;

figure(3); hold on;
SPHERE_pyramid_plot(SPHERE_pyramid(Noisy_data, n));
saveas(gcf,fullfile(fpath, 'sphere_noisy_details'),'fig');
hold off;

figure(4); hold on;
SPHERE_pyramid_plot(SPHERE_pyramid(denoised, n));
saveas(gcf,fullfile(fpath, 'sphere_denoised_details'),'fig');
hold off;


