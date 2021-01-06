function [prev_data, details]  =  SPD_decompose(data)

prev_data  = SPD_cubic_decimate(data);

refined   = SPD_cubic_refine(prev_data);

for k = 1 : length(data)-2
    details{k}  =  SPD_Log(refined{k},data{k+1});
end

details{length(data)-1} =  details{2};
details{length(data)}   =  details{1};

end



