function new_data = SPHERE_four_point_refine(data)
% Cubic spline refinement

[L,n]      =  size(data);

new_data   =  zeros(2*L-1, n);

alpha_od   =  1/16*[-1, 9, 9, -1];

if n~=3
    error('Error in Dimensions');
end

% Interpolating
for k = 1: L
    new_data(2*k-1, :) = data(k, :);
end

for k = 2: L - 2
    new_data(2*k, :) = SPHERE_Frechet_mean([data(k-1, :); data(k, :); data(k+1, :); data(k+2, :)], alpha_od);
end

% Fixing the right boundary conditions
new_data(2, :)      =  SPHERE_Frechet_mean([data(end-1, :); data(1, :); data(2, :); data(3, :)], alpha_od);
new_data(end-1, :)  =  SPHERE_Frechet_mean([data(end-2, :); data(end-1, :); data(1, :); data(2, :)], alpha_od);

end



