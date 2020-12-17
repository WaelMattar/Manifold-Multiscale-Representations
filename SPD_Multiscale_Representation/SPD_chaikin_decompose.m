function [prev_data, details]  =  SPD_chaikin_decompose(data)

prev_data  = SPD_chaikin_decimate(data);

refined   = SPD_chaikin_refine(prev_data);

for k = 1 : length(data)
    details{k}  =  SPD_Log(refined{k},data{k});
end

end

