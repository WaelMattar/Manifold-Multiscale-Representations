function  [pyramid]  =  SPHERE_pyramid(data, iter)
% Decomposing given data with iter iterations

pyramid      =  cell(iter, 1);

pyramid{end} = data;

for k = iter: -1: 2
    [pyramid{k-1}, pyramid{k}]  =  SPHERE_decompose(pyramid{k});
end

end

