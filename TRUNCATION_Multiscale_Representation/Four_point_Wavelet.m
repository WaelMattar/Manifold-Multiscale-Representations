function  [pyramid]  =  Four_point_Wavelet(iter)
% iter = iterations of decompositions

pyramid  =  cell(iter, 1);

pyramid{end} = Build_curve(iter);

for k = iter: -1: 2
    [pyramid{k-1}, pyramid{k}]  =  Four_point_Decompose(pyramid{k});
end

end


