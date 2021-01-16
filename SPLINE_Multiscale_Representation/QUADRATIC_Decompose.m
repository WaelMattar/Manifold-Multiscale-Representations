function [prev_data, details]  =  QUADRATIC_Decompose(data, eps)
% One iteration of decomposing data

prev_data  =  QUADRATIC_decimate(data, eps);

refined    =  QUADRATIC_refine(prev_data);

details    =  zeros(length(data), 1);

for k = 1 : length(data)-2
    details(k)  =  data(k+1) - refined(k);
end

details(length(data)-1) =  details(2);
details(length(data))   =  details(1);

end
