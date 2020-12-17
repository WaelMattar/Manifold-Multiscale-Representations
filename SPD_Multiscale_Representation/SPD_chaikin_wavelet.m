function [pyramid]  =  SPD_chaikin_wavelet(iter)


pyramid  =  cell(iter, 1);

pyramid{end} = SPD_build_curve(iter);

for k = iter: -1: 2
    [pyramid{k-1}, pyramid{k}]  =  SPD_chaikin_decompose(pyramid{k});
end


end

