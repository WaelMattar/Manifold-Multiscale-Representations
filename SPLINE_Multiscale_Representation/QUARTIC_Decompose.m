function [prev_data, details]  =  QUARTIC_Decompose(data, eps)
% One iteration of decomposing data

prev_data  =  QUARTIC_decimate(data, eps);

refined    =  QUARTIC_refine(prev_data);

details    =  zeros(length(data), 1);

for k = 1 : length(data)-14
    details(k)  =  data(k+13) - refined(k);
end

details(end-13: end) =  details(1:14);

end
