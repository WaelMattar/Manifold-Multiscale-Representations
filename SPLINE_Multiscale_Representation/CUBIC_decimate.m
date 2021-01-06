function new_data = CUBIC_decimate(data, eps)
% Quadratic spline decimation

alpha_ev   =  1/8 * [1 6 1];
gamma      =  AffineInvariant(find_gamma(alpha_ev.', eps));

new_data = conv(Downsampling(data), gamma, 'same');

end




