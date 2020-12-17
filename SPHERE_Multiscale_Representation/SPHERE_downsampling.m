function new_data = SPHERE_downsampling(data)
% Downsampling - taking every other element

[m,n] = size(data);
if   mod(m, 2) == 0 || n~=3
    error('Data size is even, or error in size\n');
end

new_data = zeros((m + 1)/2, 3);

for k = 1: length(new_data)
      new_data(k, :)   =    data(2*k-1, :); 
end


end



