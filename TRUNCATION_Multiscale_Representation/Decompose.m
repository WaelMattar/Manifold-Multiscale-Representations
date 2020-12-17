function [prev_data, details]  =  Decompose(data, eps, char)
% One iteration of decomposing data

if nargin == 2
    char = 'N';
end

prev_data  =  Cubic_decimate(data, eps, char);

refined    =  Cubic_refine(prev_data);

details    =  zeros(length(data), 1);

for k = 1 : length(data)
    details(k)  =  data(k) - refined(k);
end


end
