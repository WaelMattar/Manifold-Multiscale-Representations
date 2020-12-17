function data   =   Build_curve(iter)
% Defining a scalar valued curve and sampling it

syms x;
syms f(x);

f(x)      =      1/3*exp(-2*(x-2)^2) + 1/5*exp(-5*(x-5)^2) - 1/7*exp(-3*(x-7)^2);
grid      =      linspace(0,10, 10*2^(iter-1)+1);
data      =      double(f(grid));

end
