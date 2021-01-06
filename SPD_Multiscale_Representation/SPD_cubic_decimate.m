function  new_data = SPD_cubic_decimate(data)

m          =  length(data);
L          =  (m+1)/2;
alpha_ev   =  1/8*[1 6 1];
eps        =  5;

gamma      =  AffineInvariant(find_gamma(alpha_ev.', eps));

G          =  length(gamma);
half_G     =  floor(G/2);

downsampled    =  SPD_downsampling(data);
new_data       =  cell(L, 1);

duplicated  =  [downsampled; downsampled(2:end); downsampled(2:end)];


for   k = 1: L
      new_data{k}   =  SPD_Frechet_mean(duplicated(L+k - half_G : L+k + half_G), gamma);
end

for j = 1: length(new_data)
    new_data{j} = new_data{j,1}{1,1};
end


end


