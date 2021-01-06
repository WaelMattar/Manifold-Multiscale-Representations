
clear;
close all;

% Sampling and transforming
n            =   6;
[pyramid]    =   SPHERE_wavelet(n);

% Workspace
norms        =   zeros(n - 1, 1);
range        =   linspace(1,n - 1, n - 1);
details_norms   =    cell(n - 1, 1);
N   =  cell(n, 1);
for j = 1:n
    N{j} = linspace(0, 2*pi, 10*2^(j-1)+1);  
end

% Measuring the norms
for k = 1 : n-1
   details_norms{k}    =  sqrt(sum(pyramid{k+1}.^2,2));
   norms(k)            =  max(details_norms{k});
end

% Demonstrations
figure(1); hold on;

subplot(n - 1 , 1, 1);
for k = 1 : n - 1 
       subplot(n - 1, 1, k);
       stem(N{k+1}, details_norms{k},'b','Marker','none','LineWidth',1);
       xlabel(['$\|d^{(',num2str(k),')}_k\|$'],'interpreter','latex');
       set(gca,'XTickLabel',[]);
       xlim([0, 2*pi]);
       yticklabels = [0, norms(k)];
       set(gca,'YTick', yticklabels);
       set(gca,'fontsize',14);
end
fpath = 'D:\Program Files\MATLAB\R2015b\SPHERE_Multiscale_Representation\Generated_Images';
saveas(gcf,fullfile(fpath, 'sphere_multiscale_details'),'fig');
hold off;

figure(2); hold on; grid on;
plot(range, log10(norms), 'b', 'LineWidth', 2);
xlabel('Level of Details -- $\ell$','interpreter','latex');
ylabel('$\log_{10}\|d^{(\ell)}\|_\infty$','interpreter','latex');
set(gca,'fontsize',14);
saveas(gcf,fullfile(fpath, 'sphere_multiscale_norms'),'fig');
hold off;


