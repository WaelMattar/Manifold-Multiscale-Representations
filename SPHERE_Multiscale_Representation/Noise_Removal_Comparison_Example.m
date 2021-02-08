
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
cubic_pyramid        =  SPHERE_pyramid(Noisy_data, n);
four_point_pyramid   =  SPHERE_four_point_pyramid(Noisy_data, n);

% Noise filtering
for k = 2: n
    cubic_pyramid{k} = Noise_shrink(cubic_pyramid{k}, 0.14);
    four_point_pyramid{k} = Noise_shrink(four_point_pyramid{k}, 0.07);
end

% Reconstruction
cubic_denoised                  =   cubic_pyramid{1};
four_point_denoised             =   four_point_pyramid{1};

for k = 2: n
   cubic_denoised       =  SPHERE_reconstruct(cubic_denoised, cubic_pyramid{k});
   four_point_denoised  =  SPHERE_four_point_reconstruct(four_point_denoised, four_point_pyramid{k});
end

% Connecting geodesics
geodesics = Noisy_data;
for k = 1: 2
    geodesics = SPHERE_DD0_refine(geodesics);
end

% Demonstrations
figure(1); hold on;
SPHERE_plot(geodesics);
hold off;

figure(2); hold on;
SPHERE_plot(cubic_denoised);
hold off;

figure(3); hold on;
SPHERE_plot(four_point_denoised);
hold off;

