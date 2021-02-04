function [prev_data, details]  =  Four_point_Decompose(data)
% One iteration of decomposing data

prev_data  =  Downsampling(data);

refined    =  Four_point_refine(prev_data);

details    =  zeros(length(data), 1);

for k = 1 : length(data)
    details(k)  =  data(k) - refined(k);
end


end