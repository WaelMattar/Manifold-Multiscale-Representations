function   mean  =  SPD_Frechet_mean(Mat_arr, w)

if (length(Mat_arr) ~= length(w))
     error('SPDs and weights are not of the same size');
end

p                =   length(Mat_arr);
number_of_iter   =   5;

X                =   cell(number_of_iter,1);
X{1}             =   SPD_GIM(Mat_arr, w);

for l = 1:number_of_iter-1
    
    theta_sum        =   0;
    gradient_sum     =   zeros(3);
    
    for sigma = 1:p
         [~,D]     = eigs( mpower(X{l},-0.5) * Mat_arr{sigma} * mpower(X{l},-0.5) );
         c_sigma   = D(3,3) / D(1,1);
         theta_sum = theta_sum + w(sigma)*(c_sigma+1)*log(c_sigma)/(c_sigma-1);
    end
    
    theta = 2/(theta_sum);
    
    for sigma = 1:p
        gradient_sum = gradient_sum + w(sigma)*logm( inv(X{l}) * Mat_arr{sigma} );
    end
    
    X{l+1}  =  X{l}*expm(theta * gradient_sum);
    
end

mean = X(end);

end





