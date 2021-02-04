
clear;
close all;

n     =   6;
eps   =   6;
char  =   'A';

for k = 1: n
   grids{k}  =  linspace(0, 10, 10*2^(k-1)+1);  
end

% Pyramid transform based on four point subdivision scheme
Four_pyramid    =  Four_point_Wavelet(n);

% Pyramid transform based on cubic B-spline subdivision scheme
Cubic_pyramid   =  Wavelet(n, eps, char);

for k = 1 : n-1
   Four_details_norms{k}    =  abs(Four_pyramid{k+1});
   Four_norms(k)            =  max(Four_details_norms{k});
   
   Cubic_details_norms{k}   =  abs(Cubic_pyramid{k+1});
   Cubic_norms(k)            =  max(Cubic_details_norms{k});
end

% Demonstrations
figure(1); hold on;
subplot(n - 1 , 1, 1);
for k = 1 : n - 1 
       subplot(n - 1, 1, k);
       stem(grids{k+1}, Four_details_norms{k},'b','Marker','none','LineWidth',1);
       xlabel(['$\|d^{(',num2str(k),')}_k\|$'],'interpreter','latex');
       set(gca,'XTickLabel',[]);
       xlim([0, 10]);
       yticklabels = [0, Four_norms(k)];
       set(gca,'YTick', yticklabels);
       set(gca,'fontsize',14);
end
suptitle('Interpolating Multiscale Transform');
hold off;

figure(2); hold on;
subplot(n - 1 , 1, 1);
for k = 1 : n - 1 
       subplot(n - 1, 1, k);
       stem(grids{k+1}, Cubic_details_norms{k},'b','Marker','none','LineWidth',1);
       xlabel(['$\|d^{(',num2str(k),')}_k\|$'],'interpreter','latex');
       set(gca,'XTickLabel',[]);
       xlim([0, 10]);
       yticklabels = [0, Cubic_norms(k)];
       set(gca,'YTick', yticklabels);
       set(gca,'fontsize',14);
end
suptitle('Non-Interpolating Multiscale Transform');
hold off;





