function new_data = Four_point_refine(data)

new_data    =  Upsampling(data);

for k = 2: length(data) - 2
    new_data(2*k) = 9/16 * (data(k)+data(k+1)) -1/16 * (data(k-1)+data(k+2));
end

% Fixing the boundary conditions
new_data(2)      =  9/16 * (data(1)+data(2)) -1/16 * (data(end-1)+data(3));
new_data(end-1)  =  9/16 * (data(end-1)+data(end)) -1/16 * (data(end-2)+data(2));

end