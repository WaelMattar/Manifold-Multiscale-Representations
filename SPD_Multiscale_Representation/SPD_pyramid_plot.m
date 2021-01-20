function SPD_pyramid_plot(pyramid)

shifted_pyramid = SPD_pyramid_shift(pyramid);

L              =  length(shifted_pyramid);
details_norms  =  cell(L-1, 1);
norms          =  zeros(L-1, 1);

% Grids
N   =  cell(L, 1);
for j = 1:L
    N{j} = linspace(0, 10, 10*2^(j-1)+1);
end

% Measuring the norms of the details sets
for i = 1 : L - 1
    for k = 1: length(shifted_pyramid{i + 1})
            details_norms{i}(k)  =  norm(shifted_pyramid{i + 1,1}{1,k},'fro');
    end
   norms(i)            =  max(abs(details_norms{i}));
end

subplot(L - 1 , 1, 1);
for k = 1 : L - 1 
       subplot(L - 1, 1, k);
       stem(N{k+1}, details_norms{k},'b','Marker','none','LineWidth',1);
       ylabel(['scale ',num2str(k)],'interpreter','latex');
       set(gca,'XTickLabel',[]);
       xlim([0, 10]);
       ytck = [0, norms(k)];
       set(gca,'YTick', ytck);
       set(gca,'fontsize',20);
       set(gca, 'xtick', [0, 10]);
end
set(gcf,'position',[10,10,700,600]);

end