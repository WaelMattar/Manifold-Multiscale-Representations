function new_data = QUADRATIC_decimate(data, eps)
% Quadratic spline decimation

alpha_ev    =    1/4*[3 1];
gamma      =  AffineInvariant(find_gamma(alpha_ev.', eps));
gamma      =  vertcat(zeros(length(gamma), 1), gamma);

new_data = conv(Downsampling(data), gamma, 'same');

end




