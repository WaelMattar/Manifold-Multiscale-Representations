function  [pyramid]  =  Wavelet(iter, eps, char)
% iter = iterations of decompositions
% eps  = truncation parameter
% char = 'A' for Affine Invariance

if nargin == 2
    char = 'N';
end

pyramid  =  cell(iter, 1);

pyramid{end} = Build_curve(iter);

for k = iter: -1: 2
    [pyramid{k-1}, pyramid{k}]  =  Decompose(pyramid{k}, eps, char);
end


end


