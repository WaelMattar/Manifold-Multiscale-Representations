
clear;
close all;

% Sampling and transforming
n            =   6;
[pyramid]    =   SPHERE_wavelet(n);
range        =   linspace(1,n - 1, n - 1);

% Demonstrations
figure(1); hold on;
SPHERE_pyramid_plot(pyramid);
fpath = 'D:\Git_Projects\Manifold-Multiscale-Representations\SPHERE_Multiscale_Representation\Generated_Images';
saveas(gcf,fullfile(fpath, 'sphere_multiscale_details'),'fig');
hold off;


