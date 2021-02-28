function v = SPHERE_Log(x, p)
% Log map at basepoint x

v    =   (p - x*(x*p.')) * acos(x*p.')/sqrt(1 - (x*p.')^2);

if norm(v, 2) < 1e-12
    v   =   zeros(1, 3);
end

end


