function [prev_data, details]  =  SPHERE_four_point_decompose(data)
% One iteration of decomposition

prev_data  =  SPHERE_downsampling(data);

refined    =  SPHERE_four_point_refine(prev_data);

details    =  zeros(size(data, 1), 3); 

for k = 1 : length(data)
    details(k, :)  =  SPHERE_Log(refined(k, :), data(k, :));
end

details(isnan(details))=0;

end
