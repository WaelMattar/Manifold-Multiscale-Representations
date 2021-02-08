function reconstructed = SPHERE_four_point_reconstruct(data, details)
% One iteration of reconstruction

refined   =   SPHERE_four_point_refine(data);
L         =   length(refined);

if L ~= length(details)
    error('Error in dimensions when reconstructing!');
end

reconstructed = zeros(L, 3);
for k = 1:L
    reconstructed(k, :) = SPHERE_Exp(refined(k, :), details(k,:));
end

end