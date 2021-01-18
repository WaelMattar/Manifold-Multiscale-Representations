
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
fpath = 'D:\Program Files\MATLAB\R2015b\SPD_Multiscale_Representation\Generated_Images';
saveas(gcf,fullfile(fpath, 'spd_sampled_points'),'fig');
hold off;

figure(2); hold on;
SPD_pyramid_plot(pyramid, 'dual');
saveas(gcf,fullfile(fpath, 'spd_multiscale_details'),'fig');
hold off;

figure(3); hold on;
grid on;
plot(range, log10(norms), 'b', 'LineWidth', 2);
xlabel('Level of Details -- $\ell$','interpreter','latex');
ylabel('$\log_{10}\|d^{(\ell)}\|_\infty$','interpreter','latex');
set(gca,'fontsize',14);
saveas(gcf,fullfile(fpath, 'spd_multiscale_norms'),'fig');
hold off;

