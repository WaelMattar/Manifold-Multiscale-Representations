function new_data = SPHERE_cubic_refine(data)
% Cubic spline refinement

[L,n]      =  size(data);

if n~=3
    error('Error in Dimensions');
end

alpha_ev = 1/8*[1 6 1];
alpha_od = 1/8*[4 4];

new_data  =  zeros(2*L-1, 3);

for i = 2: L-1
    new_data(2*i,:)      =  SPHERE_Frechet_mean(data(i-1:i+1, :), alpha_ev);
end

for i = 1: L-1
    new_data(2*i+1, :)   =  SPHERE_Frechet_mean(data(i:i+1, :), alpha_od);
end

% Fixing the right boundary conditions
new_data(1, :)    =  SPHERE_Frechet_mean([data(end-1,:); data(1,:)], alpha_od);
new_data(2, :)    =  SPHERE_Frechet_mean([data(end-1,:); data(1,:); data(2,:)], alpha_ev);


end



