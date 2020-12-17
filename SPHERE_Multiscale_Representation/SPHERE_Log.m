function v = SPHERE_Log(x, p)
% Log map

if norm(x - p, 2) > 1e-4
    v    =   (p - x*(x*p.')) * acos(x*p.')/sqrt(1 - (x*p.')^2);
else
    v    =    zeros(3, 1);
end

end


