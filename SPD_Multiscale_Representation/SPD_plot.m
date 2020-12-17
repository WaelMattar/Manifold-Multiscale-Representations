function h = SPD_plot(data)

L    = length(data);

if L == 1
              h = SPD_ellipse_plot(data{1}, [0 0 0]);
else
   for i=1:L
              h = SPD_ellipse_plot(data{i}, [10/(L-1)*i-10/(L-1) 0 0]);
   end
    
end

xlim([-0.3, 10.3]);
light('Position',[5 0 5],'Style','local');
set(gcf,'position',[10,10,2400,110]);
set(gca,'visible','off');
zoom(5.3);
view([0,0]);
hold off;

end



