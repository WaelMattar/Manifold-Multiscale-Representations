function SPHERE_pyramid_plot(pyramid)

n   =  length(pyramid);
N   =  cell(n, 1);
for j = 1:n
    N{j} = linspace(0, 2*pi, 10*2^(j-1)+1);  
end

details_norms   =    cell(n - 1, 1);
max_norms       =    zeros(n - 1, 1);

% Measuring the norms
for k = 1 : n-1
   details_norms{k}    =  sqrt(sum(pyramid{k+1}.^2,2));
   max_norms(k)            =  max(details_norms{k});
end

subplot(n - 1 , 1, 1);
for k = 1 : n - 1 
       subplot(n - 1, 1, k);
       stem(N{k+1}, details_norms{k},'b','Marker','none','LineWidth',1);
       ylabel(['scale ',num2str(k)],'interpreter','latex');
       set(gca,'XTickLabel',[]);
       xlim([0, 2*pi]);
       yticklabels = [0, max_norms(k)];
       set(gca, 'xtick', [0, 2*pi]);
       set(gca,'YTick', yticklabels);
       set(gca,'fontsize',24);
       %set(get(gca,'ylabel'),'rotation',60);
end
set(gcf,'position',[10,10,1000,800]);

end