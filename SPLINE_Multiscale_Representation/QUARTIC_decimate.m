function new_data = QUARTIC_decimate(data, eps)
% Quadratic spline decimation

alpha_ev   =  1/16 * [1 10 5];
gamma      =  AffineInvariant(find_gamma(alpha_ev.', eps));

new_data = conv(Downsampling(data), gamma, 'same');

end




