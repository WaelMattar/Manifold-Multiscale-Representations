function [prev_data, details]  =  SPD_decompose(data)

prev_data  = SPD_cubic_decimate(data);

refined   = SPD_cubic_refine(prev_data);

for k = 1 : length(data)
    details{k}  =  SPD_Log(refined{k},data{k});
end

end



