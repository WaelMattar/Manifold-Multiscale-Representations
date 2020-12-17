function new_data  =  SPD_chaikin_decimate(data)


m          =  length(data);
L          =  (m+1)/2;
alpha_ev   =  1/4*[3 1];
gamma      =  AffineInvariant(find_gamma(alpha_ev.', 4));
gamma      =  vertcat(zeros(length(gamma), 1), gamma);

G          =  length(gamma);
half_G     =  floor(G/2);

downsampled    =  SPD_downsampling(data);
new_data       =  cell(L, 1);

duplicated  =  [downsampled; downsampled(2:end); downsampled(2:end)];


for   k = 1: L
      new_data{k}   =  SPD_Frechet_mean(duplicated(L+k - half_G + 1: L+k + half_G), gamma);
end

for j = 1: length(new_data)
    new_data{j} = new_data{j,1}{1,1};
end


end