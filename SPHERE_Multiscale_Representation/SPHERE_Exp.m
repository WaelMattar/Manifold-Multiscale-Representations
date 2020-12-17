function p = SPHERE_Exp(x, v)
% Exp map

p    =   cos(norm(v)) * x + (sin(norm(v))/norm(v)) * v;

end



