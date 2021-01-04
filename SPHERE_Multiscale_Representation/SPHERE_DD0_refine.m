function new_data = SPHERE_DD0_refine(data)
% Deslauriers-Dubuc refinement: sampling piecewise geodesics

[L,n]      =  size(data);

if n~=3
    error('Error in Dimensions');
end

alpha = 1/2*[1 1];

new_data  =  zeros(2*L-1, 3);

for i = 1: L-1
    new_data(2*i,:)      =  data(i, :);
end

for i = 1: L-1
    new_data(2*i+1, :)   =  SPHERE_Frechet_mean(data(i:i+1, :), alpha);
end

% Fixing the right boundary condition
new_data(1, :)    =  SPHERE_Frechet_mean([data(end-1,:); data(1,:)], alpha);


end



