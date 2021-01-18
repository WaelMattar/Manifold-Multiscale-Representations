function SPD_pyramid_plot(pyramid, char)

if nargin == 1
    char = 'primal';
end

L              =  length(pyramid);
details_norms  =  cell(L-1, 1);
norms          =  zeros(L-1, 1);

% Grids
N   =  cell(L, 1);
for j = 1:L
    N{j} = linspace(0, 10, 10*2^(j-1)+1);
    if strcmp(char, 'dual')
        N{j}  =  N{j} + (1/2 - 1/2^j)* ones(1, 10*2^(j-1)+1);   % Shifting
    end
end

% Measuring the norms of the details sets
for i = 1 : L - 1
    for k = 1: length(pyramid{i + 1})
            details_norms{i}(k)  =  norm(pyramid{i + 1,1}{1,k},'fro');
    end
   norms(i)            =  max(abs(details_norms{i}));
end

subplot(L - 1 , 1, 1);
for k = 1 : L - 1 
       subplot(L - 1, 1, k);
       stem(N{k+1}, details_norms{k},'b','Marker','none','LineWidth',1);
       xlabel(['$\|d^{(',num2str(k),')}_k\|_F$'],'interpreter','latex');
       set(gca,'XTickLabel',[]);
       xlim([0, 10]);
       ytck = [0, norms(k)];
       set(gca,'YTick', ytck);
       set(gca,'fontsize',12);
end
set(gcf,'position',[10,10,700,600]);

end