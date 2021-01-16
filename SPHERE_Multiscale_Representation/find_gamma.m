function gamma = find_gamma(alpha, eps)
% Even-inverting the mask alpha and truncating with 1e-eps

GammaLength      =  100; 
L                =  length(alpha);

zero_pad_size    =  floor((GammaLength-L)/2);
zero_pad         =  zeros(zero_pad_size,1);
padded_vec       =  [zero_pad;alpha;zero_pad];

gamma_mask = ifft( 1./fft(padded_vec) );

% Truncating
indices = zeros(length(gamma_mask), 1);
for k=1:length(indices)
    if abs(gamma_mask(k)) > 10^(-eps)
        indices(k) = 1;
    end
end

% Filling the places
res = zeros(length(gamma_mask), 1);
for k=1:length(res)
    if indices(k) == 1
        res(k) = gamma_mask(k);
    end
end

supp_min = find(res ~= 0, 1, 'first');
supp_max = find(res ~= 0, 1, 'last');
gamma=res(supp_min:supp_max);

end

