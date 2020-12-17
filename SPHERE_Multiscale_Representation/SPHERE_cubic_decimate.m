function new_data = SPHERE_cubic_decimate(data)
% Cubic spline decimation 

[m, n]         =  size(data);
L              =  (m+1)/2;

if   mod(m, 2) == 0 || n~=3
    error('The number of the data is even! or  error in dimension');
end

alpha_ev  =  1/8*[1 6 1];
gamma =  AffineInvariant(find_gamma(alpha_ev.', 3));

G         =  length(gamma);
half_G    =  floor(G/2);

downsampled   =  SPHERE_downsampling(data);
duplicated    =  [downsampled; downsampled(2:end, :); downsampled(2:end, :)];

new_data  =  zeros(L, 3);

for k = 1: L
    new_data(k, :)    =  SPHERE_Frechet_mean(duplicated(L+k - half_G: L+k + half_G, :), gamma);
end
    

end
