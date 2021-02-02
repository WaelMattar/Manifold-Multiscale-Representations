
clear;
close all;

data   =   Build_curve(1);

n      =   4;
grids  =   Build_grids(n);

ref    =   cell(n, 1);
ref{1} =   data;
for k = 2: n
    ref{k} = QUADRATIC_refine(ref{k-1});
end

% Demonstrations 
figure(1); hold on; grid on;
xlim([0 10]);
plot(grids{1},ref{1});
for k = 1:n
    plot(grids{k},ref{k},'LineWidth', 2);
end
set(gca,'units','normalized','position',[0 0 1 1])
set(gcf,'color','white')
axis off



