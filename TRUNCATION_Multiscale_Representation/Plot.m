function Plot(data)
% Plotting points on the interval [0,2pi]

L        =    length(data);
range    =    linspace(0, 2*pi, L);

scatter(range, data, 'b', 'filled');
xlim([0, 2*pi]);

end