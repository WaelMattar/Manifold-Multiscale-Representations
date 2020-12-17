
clear;
close all;

n   =   6;
eps =   4;

[pyramid] = QUARTIC_Wavelet(n, eps);
grids     = Build_grids(n);

details_norms   =    cell(n - 1, 1);

% Measuring the norms
for k = 1 : n-1
   details_norms{k}    =  abs(pyramid{k+1});
   norms(k)            =  max(details_norms{k});
end

% Demonstrations
figure(1); hold on;

subplot(n - 1 , 1, 1);
for k = 1 : n - 1 
       subplot(n - 1, 1, k);
       stem(grids{k+1}, details_norms{k},'b','Marker','none','LineWidth',1);
       xlabel(['$\|d^{(',num2str(k),')}_k\|$'],'interpreter','latex');
       set(gca,'XTickLabel',[]);
       xlim([0, 10]);
       yticklabels = [0, norms(k)];
       set(gca,'YTick', yticklabels);
       set(gca,'fontsize',14);
end






