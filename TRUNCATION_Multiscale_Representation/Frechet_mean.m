function mean = Frechet_mean(data, w)
% Calculates Frechet mean of data with weights w

if length(data) ~= length(w)
    error('Error in Dimensions!');
end

mean = 0;

for k = 1: length(data)
    mean = mean + data(k)*w(k);
end

end


