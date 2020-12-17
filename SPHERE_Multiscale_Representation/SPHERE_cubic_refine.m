function new_data = SPHERE_cubic_refine(data)
% Cubic spline refinement

[m,n]      =  size(data);

if n~=3
    error('Error in Dimensions');
end

alpha_ev = 1/8*[1 6 1];
alpha_od = 1/8*[4 4];

new_data  =  zeros(2*m-1, 3);

for i = 1: m-1
    new_data(2*i-1,:)  =  SPHERE_Frechet_mean(data(i:i+1, :), alpha_od);
end

for i = 2: m-1
    new_data(2*i, :)   =  SPHERE_Frechet_mean(data(i-1:i+1, :), alpha_ev);
end

% Fixing the right boundary condition
new_data(end, :)    =  SPHERE_Frechet_mean([data(end, :); data(2, :)], alpha_od);
    
% Fixing the left boundary condition
new_data(2, :)      =  SPHERE_Frechet_mean([data(end-1,:); data(1,:); data(2,:)], alpha_ev);
    

end



