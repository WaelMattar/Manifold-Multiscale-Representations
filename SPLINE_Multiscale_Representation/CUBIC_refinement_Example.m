
clear;
close all;

data   =   Build_curve(1);

n      =   5;
grids  =   cell(n, 1);

for k = 1: n
   grids{k}  =  linspace(0, 10, 10*2^(k-1)+1);  
end

ref    =   cell(n, 1);
ref{1} =   data;
for k = 2: n
    ref{k} = CUBIC_refine(ref{k-1});
end

% Demonstrations 
figure(1); hold on; grid on;
xlim([0 10]);
plot(grids{1},ref{1});
for k = 1:n
    plot(grids{k},ref{k},'LineWidth', 2);
end




