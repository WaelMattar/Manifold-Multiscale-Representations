function p = SPHERE_Exp(x, v)
% Exp map

if norm(v) < 1e-7
    p   =   x;
else
    p   =   cos(norm(v)) * x + (sin(norm(v))/norm(v)) * v;
end 

end



