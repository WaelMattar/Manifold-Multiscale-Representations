
clear;
close all;

N1   =  linspace(0, 10, 11);
N2   =  linspace(0, 10, 21);
N2cc =  N2 + 0.25*ones(1, 21);

rng('default');
initial_data = abs(rand(11,1));

fourpt      =  Four_point_refine(initial_data);
cubicsp     =  CUBIC_refine(initial_data);
cc          =  QUADRATIC_refine(initial_data);

figure(1); hold on; 
set(gca,'YColor','none');
ylim([0, 1.1]);
scatter(N1, initial_data, 60, 'filled', 'b');
set(gca,'FontSize', 15);
hold off; 

figure(2); hold on;
set(gca,'YColor','none');
ylim([0, 1.1]);
plot(N2, fourpt, 'LineWidth', 3, 'color', 'r');
scatter(N1, initial_data, 60, 'filled', 'b');
set(gca,'FontSize', 15);
hold off;

figure(3); hold on;
set(gca,'YColor','none');
ylim([0, 1.1]);
plot(N2, cubicsp, 'LineWidth', 3, 'color', 'r');
scatter(N1, initial_data, 60, 'filled', 'b');
set(gca,'FontSize', 15);
hold off;

figure(4); hold on;
set(gca,'YColor','none');
ylim([0, 1.1]);
xlim([0, 10]);
plot(N2cc(1:end-1), cc(1:end-1), 'LineWidth', 3, 'color', 'r');
scatter(N1, initial_data, 60, 'filled', 'b');
set(gca,'FontSize', 15);
hold off;


