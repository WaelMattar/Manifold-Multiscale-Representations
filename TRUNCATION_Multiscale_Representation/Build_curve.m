function data   =   Build_curve(iter)
% Defining a scalar valued curve and sampling it

syms x;
syms f(x);

f(x)      =      sin(3*x);
grid      =      linspace(0, 2*pi, 10*2^(iter-1)+1);
data      =      double(f(grid));

end



