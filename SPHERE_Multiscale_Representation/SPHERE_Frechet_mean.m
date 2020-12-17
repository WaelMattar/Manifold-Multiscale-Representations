function p = SPHERE_Frechet_mean(data, w)
% Riemannian gradient descend for calculating Frechet mean

[m, ~]  =  size(data);
iter     =   5;

if length(w)~= m 
      error('Error in Dimensions');
end

X        =  zeros(iter, 3);
X(1,:)   =  data(1, :);

for k = 1:  iter - 1
    
    temp   =  zeros(1, 3);
    for j = 1: m
        temp = temp + w(j) * SPHERE_orthogonal_projection_wrt_x(X(k, :), data(j, :)); 
    end
    
    X(k+1, :)    =   SPHERE_Exp(X(k,:), temp);
end

p        =  X(iter, :);

end


