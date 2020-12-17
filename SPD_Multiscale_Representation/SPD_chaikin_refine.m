function new_data = SPD_chaikin_refine(data)

L        = length(data);
new_data = cell(2*L-1,1);

alpha_ev = 1/4*[3 1];
alpha_od = 1/4*[1 3];

for i=1:L-1
    new_data{2*i-1}  =  SPD_Frechet_mean(data(i: i+1), alpha_ev);
end

for i=2:L-1
    new_data{2*i}    =  SPD_Frechet_mean(data(i: i+1), alpha_od);
end

% Fixing the right boundary condition
new_data{end}    =  SPD_Frechet_mean({data{end} data{2}}, alpha_ev);
    
% Fixing the left boundary condition
new_data{2}      =  SPD_Frechet_mean({data{1} data{2}}, alpha_od);   
    
for j = 1: length(new_data)
    new_data{j} = real(new_data{j,1}{1,1});
end

end

