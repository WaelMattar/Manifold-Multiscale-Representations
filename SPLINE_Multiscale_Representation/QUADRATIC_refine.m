function new_data = QUADRATIC_refine(data)

alpha = 1/4* [1 3 3 1];
new_data = conv(Upsampling(data), alpha, 'same');

end
