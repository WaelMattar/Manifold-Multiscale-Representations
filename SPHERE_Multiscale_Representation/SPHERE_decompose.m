function [prev_data, details]  =  SPHERE_decompose(data)
% One iteration of decomposition

prev_data  =  SPHERE_cubic_decimate(data);

refined    =  SPHERE_cubic_refine(prev_data);

details    =  zeros(size(data, 1), 3); 

for k = 1 : length(data)
    details(k, :)  =  SPHERE_Log(refined(k, :), data(k, :));
end


end
