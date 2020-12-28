
clear;
close all;

% Sampling the curve
n             =  6;
points        =  SPHERE_build_curve(10*2^(n-1)+1);

% Workspace
pyramid       =  cell(n, 1);
range         =  linspace(1,n - 1, n - 1);
norms         =  zeros(n - 1, 1);

% Generating 2-dimensional normally distributed noise
mu            =  zeros(1, 2);
Sigma         =  1/1000 * eye(2);
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
pyramid{end}  =  Noisy_data;
for k = n: -1: 2
    [pyramid{k-1}, pyramid{k}]  =  SPHERE_decompose(pyramid{k});
end

% Measuring the norms of the details
for k = 2: n
    norms(k - 1) = max(sqrt(sum(pyramid{k}.^2,2)));
end

% Reconstruction of truncated pyramid
num_of_truncated_details       =   3; 
reconstructed                  =   pyramid{1};
for k = 2: n - num_of_truncated_details
   reconstructed  =  SPHERE_reconstruct(reconstructed, pyramid{k}); 
end

% Refining the reconstructed curve
for k = 1: num_of_truncated_details
    reconstructed = SPHERE_cubic_refine(reconstructed);
end

% Demonstrations
figure(1); hold on;
SPHERE_plot(Noisy_data);
fpath = 'D:\Program Files\MATLAB\R2015b\SPHERE_Multiscale_Representation\Generated_Images';
saveas(gcf,fullfile(fpath, 'sphere_noisy_points'),'fig');
fprintf('Noisy curve std: %f\n', Noise_measure(Noisy_data));
hold off;

figure(2); hold on; grid on;
h = plot(range, log10(norms), 'b', 'LineWidth', 2);
xlabel('Level of details -- $\ell$','interpreter','latex');
ylabel('$\log_{10}\|d^{(\ell)}\|_\infty$','interpreter','latex');
set(gca,'fontsize',18);
xlim([1, n-1]);
saveas(gcf,fullfile(fpath, 'sphere_noisy_details'),'fig');
hold off;

figure(3); hold on;
SPHERE_plot(reconstructed);
saveas(gcf,fullfile(fpath, 'sphere_denoised_points'),'fig');
fprintf('Denoised curve std: %f\n', Noise_measure(reconstructed));
hold off;

