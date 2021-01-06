function  [pyramid]  =  CUBIC_Wavelet(iter, eps)
% iter = iterations of decompositions
% eps  = truncation parameter
% char = 'A' for Affine Invariance

pyramid  =  cell(iter, 1);

pyramid{end} = Build_curve(iter);

for k = iter: -1: 2
    [pyramid{k-1}, pyramid{k}]  =  CUBIC_Decompose(pyramid{k}, eps);
end


end


