
clear;
close all;

% Level of sampling
n               =    6;

% Workspace
norms           =    zeros(n - 1, 1);
range           =    linspace(1, n - 1, n - 1);
details_norms   =    cell(n - 1, 1);
N   =  cell(n, 1);
for j = 1:n
    N{j} = linspace(0, 10, 10*2^(j-1)+1);  
end

% Multiscale transform
[pyramid]       =    SPD_wavelet(n);

% Measuring the norms of the coarse set
coarse_norms    =    zeros(length(pyramid{1}), 1);
for j = 1: length(pyramid{1})
     coarse_norms(j)    =    norm(pyramid{1,1}{j,1},'fro');
end

% Measuring the norms of the details sets
for i = 1 : n - 1
    for k = 1: length(pyramid{i + 1})
            details_norms{i}(k)  =  norm(pyramid{i + 1,1}{1,k},'fro');
    end
   norms(i)            =  max(abs(details_norms{i}));
end

% Demonstrations
figure(1); hold on;
curve_data      =    SPD_build_curve(3);
SPD_plot(curve_data);
fpath = 'D:\Program Files\MATLAB\R2015b\SPD_Multiscale_Representation\Generated_Images';
saveas(gcf,fullfile(fpath, 'spd_sampled_points'),'fig');
hold off;

figure(2); hold on;
subplot(n - 1 , 1, 1);
for k = 1 : n - 1 
       subplot(n - 1, 1, k);
       stem(N{k+1}, details_norms{k},'b','Marker','none','LineWidth',1);
       xlabel(['$\|d^{(',num2str(k),')}_k\|_F$'],'interpreter','latex');
       set(gca,'XTickLabel',[]);
       xlim([0, 10]);
       ytck = [0, norms(k)];
       set(gca,'YTick', ytck);
       set(gca,'fontsize',12);
end
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

