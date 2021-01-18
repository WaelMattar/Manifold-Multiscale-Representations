function  [pyramid]  =  SPHERE_wavelet(iter)
% Decomposing curve data samples with iter iterations

pyramid      =  cell(iter, 1);

pyramid{end} = SPHERE_build_curve(10*2^(iter-1)+1);

for k = iter: -1: 2
    [pyramid{k-1}, pyramid{k}]  =  SPHERE_decompose(pyramid{k});
end

end


