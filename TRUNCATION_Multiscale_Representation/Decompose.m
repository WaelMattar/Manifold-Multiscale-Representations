function [prev_data, details]  =  Decompose(data, eps, char)
% One iteration of decomposing data

if nargin == 2
    char = 'N';
end

prev_data  =  Cubic_decimate(data, eps, char);

refined    =  Cubic_refine(prev_data);

details    =  zeros(length(data), 1);

for k = 1 : length(data)-2
    details(k)  =  data(k+1) - refined(k);
end

details(length(data)-1) =  details(2);
details(length(data))   =  details(1);

end
