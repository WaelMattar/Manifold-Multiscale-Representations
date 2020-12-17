function new_data = Upsampling(data)
% Upsampling - adding zeros between each two consecuetive points

L         =  length(data);
new_data  =  zeros(2*L-1, 1);

for i = 1 : length(data)
    new_data(2*i-1) = data(i);
end

new_data = new_data.';

end



