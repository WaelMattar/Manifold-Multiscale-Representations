function [prev_data, details]  =  SPD_chaikin_decompose(data)

prev_data  = SPD_chaikin_decimate(data);

refined   = SPD_chaikin_refine(prev_data);

for k = 1 : length(data)-3
    details{k}  =  SPD_Log(refined{k},data{k+2});
end

details{length(data)-2} =  details{1};
details{length(data)-1} =  details{2};
details{length(data)} =  details{3};

end

