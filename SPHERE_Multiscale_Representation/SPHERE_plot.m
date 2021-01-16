function SPHERE_plot(data)
% Plotting data on unit sphere

sphere(300);
h_surfs=findobj('Type','surface');
set(h_surfs(1),'FaceColor',[0.85,0.85,0.85],'EdgeColor','none','MeshStyle','both');
xlim([-1.2 1.2]);ylim([-1.2 1.2]);
axis equal; grid off; hold on; 
light('Position',[6 0 18],'Style','local');
light('Position',[12 0 36],'Style','local');

view([145 40]);
zoom(2.2);
set(gca,'visible','off');
set(gcf,'position',[10,10,500,500]);

h = scatter3(data(:, 1),data(:, 2),data(:, 3), 100, '.k');
hChildren = get(h, 'Children');
set(hChildren, 'Markersize', 6);

end

