% Calculating eta value 
eps          =   2;
alpha        =   1/8 * [1 4 6 4 1];
alpha_ev     =   1/8 * [1 6 1].';

gamma_2      =   find_gamma(alpha_ev, eps);
gamma_20     =   find_gamma(alpha_ev, 20);

zero_padding_gamma_2  =  [zeros(48,1); gamma_2; zeros(46,1)];

diff         =   gamma_20 - zero_padding_gamma_2;

delta        =   sum(abs(diff));

alpha_norm_1 =   norm(alpha, 1);

fprintf('eta is %f\n', alpha_norm_1);