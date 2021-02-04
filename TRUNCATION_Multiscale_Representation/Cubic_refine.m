function new_data = Cubic_refine(data)
% Cubic spline refinement

alpha_ev = 1/8*[1 6 1];
alpha_od = 1/8*[4 4];

L         =  length(data);

new_data  =  zeros(2*L-1, 1);

for k = 2: L-1
    new_data(2*k)      =  alpha_ev * data(k-1:k+1).';
end

for k = 1: L-1
    new_data(2*k+1)    =  alpha_od * data(k:k+1).';
end

new_data(1)   =  alpha_od * [data(end-1) ; data(1)]; 
new_data(2)   =  alpha_ev * [data(end-1) ; data(1); data(2)]; 

end


