function [prev_data, details]  =  CUBIC_Decompose(data, eps)
% One iteration of decomposing data

prev_data  =  CUBIC_decimate(data, eps);

refined    =  CUBIC_refine(prev_data);

details    =  zeros(length(data), 1);

for k = 1 : length(data)
    details(k)  =  data(k) - refined(k);
end

end
