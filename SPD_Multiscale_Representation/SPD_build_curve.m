function  data  =  SPD_build_curve(iter)


N      =  linspace(0, 10, 10*2^(iter-1)+1);

% Anti-symmetric matrices
O      =  cell(10*2^(iter-1)+1, 1);

% Orthogonal matrices
V      =  cell(10*2^(iter-1)+1, 1);

% Data for curve
data   =  cell(10*2^(iter-1)+1, 1);

syms x;

syms f_1(x);
syms f_2(x);
syms f_3(x);

syms d_1(x);
syms d_2(x);
syms d_3(x);

% Heaviside step function
mag          = 150;
step_func(x) = mag * (heaviside(x - 10/3) - heaviside(x - 20/3));

f_1(x) = 10 +  sin(x*pi*2/5);
f_2(x) = 7  -  sin(x*pi*2/5);
f_3(x) = 7  +  cos(x*pi*2/5);

d_1(x) = 60 - 40*sin((x)*pi*2/5) + step_func(x);
d_2(x) = 60 - 20*cos((x)*pi*2/5) + step_func(x);
d_3(x) = 60 - 20*sin((x)*pi*2/5) + step_func(x);


for  i = 1: 10*2^(iter-1)+1;
O{i}   = [0, f_1(N(i)), f_2(N(i)); -f_1(N(i)), 0, f_3(N(i)); -f_2(N(i)), -f_3(N(i)), 0];
O{i}   = double(O{i});
end

for  i = 1: 10*2^(iter-1)+1;
    V{i}   =  expm(O{i});
end

for  i = 1: 10*2^(iter-1)+1;
    data{i}   =   V{i}*diag([d_1(N(i)),d_2(N(i)),d_3(N(i))])*transpose(V{i});
    data{i}   =   double(data{i});
end


end






