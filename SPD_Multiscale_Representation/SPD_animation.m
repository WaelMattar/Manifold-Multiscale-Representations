function SPD_animation(data)

L     =   length(data);

figure(1);
axis equal; xlim([-1.2 1.2]); ylim([-1.2 1.2]);
light('Position',[5 0 5],'Style','local');

for i = 1:L
      hold on;
      h = SPD_plot(data(i));
      pause(1);
      set(h,'Visible','off');
      hold off;
end


end

