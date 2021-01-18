
clear;
close all;

% Sampling the curve
n                     =  6;
data                  =  SPHERE_build_curve(10*2^(n-1)+1);

% Decomposing
[prev_data, details]  =  SPHERE_decompose(data);
refined               =  SPHERE_cubic_refine(prev_data);

% Demonstrations
figure(1); hold on;
SPHERE_plot(data);
fpath = 'D:\Git_Projects\Manifold-Multiscale-Representations\SPHERE_Multiscale_Representation\Generated_Images';
saveas(gcf,fullfile(fpath, 'sphere_sampled_points'),'fig');
hold off;

figure(2); hold on;
SPHERE_plot(prev_data);
saveas(gcf,fullfile(fpath, 'sphere_decimated_points'),'fig');
hold off;

figure(3); hold on;
sphere(300);
h_surfs=findobj('Type','surface');
set(h_surfs(1),'FaceColor',[0.85,0.85,0.85],'EdgeColor','none','MeshStyle','both');
xlim([-1.2 1.2]);ylim([-1.2 1.2]);
axis equal; grid off; hold on; 
light('Position',[4 0 12],'Style','local');
light('Position',[4 0 12],'Style','local');
view([145 40]);
zoom(2.2);
for k = 1: size(refined,1)
    c    =   refined(k, :);
    d    =   details(k, :);
    h1   =   quiver3(c(1), c(2), c(3), d(1), d(2), d(3), 'b', 'LineWidth', 1);
    hold on;
end
set(h1,'AutoScale','on', 'AutoScaleFactor', 2)
set(gca,'visible','off');
saveas(gcf,fullfile(fpath, 'sphere_decomposition_details'),'fig');
hold off;

