function filtered_details = Noise_shrink(details, eps)
% Setting to zero all details with norms below eps

L = length(details);

for k = 1: L
   if norm(details(k, :) ,2) < eps
       details(k, :) = zeros(1,3);
   end
end

filtered_details = details;

end