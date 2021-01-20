
clear;
close all;

% Level of sampling
n               =    6;

% Workspace
norms           =    zeros(n - 1, 1);
range           =    linspace(1, n - 1, n - 1);

% Multiscale transform
[pyramid]       =    SPD_chaikin_wavelet(n);

% Demonstrations
figure(1); hold on;
curve_data      =    SPD_build_curve(3);
SPD_plot(curve_data);
fpath = 'D:\Git_Projects\Manifold-Multiscale-Representations\SPD_Multiscale_Representation\Generated_Images';
saveas(gcf,fullfile(fpath, 'spd_sampled_points'),'fig');
hold off;

figure(2); hold on;
SPD_pyramid_plot(pyramid);
saveas(gcf,fullfile(fpath, 'spd_multiscale_details'),'fig');
hold off;

