function shifted_pyramid = SPD_pyramid_shift(pyramid)
% Shifting layers by making maximas on same place

L              =  length(pyramid);
details_norms  =  cell(L-1, 1);
norms          =  zeros(L-1, 1);
maxima         =  zeros(L-1, 2);

for i = 1 : L - 1
    for k = 1: length(pyramid{i + 1})
            details_norms{i}(k)  =  norm(pyramid{i + 1,1}{1,k},'fro');
    end
   norms(i)            =  max(abs(details_norms{i}));
end

for k = 1:L-1
[maxima(k,1), maxima(k,2)] = max(details_norms{k});
end

shifted_pyramid{1, 1}     = pyramid{1};
shifted_pyramid{L, 1}     = pyramid{L};

%maxima(:,2) = [4, 2, 8, 22, 48]; %for mag=150;

for k = L-1:-1:2
    idx =  floor(maxima(end,2)/(2^(L-k)) - maxima(k-1,2)) + 2;
    shifted_pyramid{k, 1}  = SPD_details_shift(pyramid{k,1}, idx).';
end

end
