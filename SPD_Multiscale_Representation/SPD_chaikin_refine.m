function new_data = SPD_chaikin_refine(data)

L        = length(data);
new_data = cell(2*L-1,1);

alpha_ev = 1/4*[3 1];
alpha_od = 1/4*[1 3];

for i=2:L-1
    new_data{2*i}  =  SPD_Frechet_mean(data(i-1: i), alpha_od);
end

for i=1:L-1
    new_data{2*i+1}    =  SPD_Frechet_mean(data(i: i+1), alpha_ev);
end

% Fixing the right boundary conditions
new_data{1}      =  SPD_Frechet_mean({data{end-1} data{1}}, alpha_ev);
new_data{2}      =  SPD_Frechet_mean({data{end-1} data{1}}, alpha_od);   

for j = 1: length(new_data)
    new_data{j} = real(new_data{j,1}{1,1});
end

end

