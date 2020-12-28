function new_data = SPD_cubic_refine(data)

L        = length(data);
new_data = cell(2*L-1,1);

alpha_ev = 1/8*[1 6 1];
alpha_od = 1/2*[1 1];

for i=2:L-1
    new_data{2*i}  =  SPD_Frechet_mean(data(i-1: i+1), alpha_ev);
end

for i=1:L-1
    new_data{2*i+1}    =  SPD_Frechet_mean(data(i: i+1), alpha_od);
end

% Fixing the right boundary conditions
new_data{1}    =  SPD_Frechet_mean({data{end-1} data{1}}, alpha_od);
new_data{2}    =  SPD_Frechet_mean({data{end-1} data{1} data{2}}, alpha_ev);

for j = 1: length(new_data)
    new_data{j} = real(new_data{j,1}{1,1});
end

end
