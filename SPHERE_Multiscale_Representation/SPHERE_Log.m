function v = SPHERE_Log(x, p)
% Log map

v    =   (p - x*(x*p.')) * acos(x*p.')/sqrt(1 - (x*p.')^2);

end


