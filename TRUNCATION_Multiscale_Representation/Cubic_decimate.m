function new_data = Cubic_decimate(data, eps, char)
% Cubic spline decimation

if nargin == 2
    char   =  'N';
end

alpha_ev    =    1/8*[1 6 1];
gamma       =    find_gamma(alpha_ev.', eps);

if strcmp(char, 'A') == 1
    gamma   =    AffineInvariant(gamma); 
end

m           =  length(data);
L           =  (m+1)/2;

G           =  length(gamma);
half_G      =  floor(G/2);
new_data    =    zeros(L, 1);

downsampled =    Downsampling(data);
duplicated  =    [downsampled, downsampled(2:end), downsampled(2:end)];

for k = 1: length(new_data)
      new_data(k)   =  Frechet_mean(duplicated(L+k - half_G : L+k + half_G), gamma);
end

new_data = new_data.';

end




