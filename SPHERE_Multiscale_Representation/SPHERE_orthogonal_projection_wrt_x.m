function p   =   SPHERE_orthogonal_projection_wrt_x(x, z)
% Orthogonal projection on sphere - used in Frechet mean calculations

p    =   z - (x * z.') * x;
end
