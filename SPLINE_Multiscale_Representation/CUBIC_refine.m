function new_data = CUBIC_refine(data)

alpha = 1/8* [1 4 6 4 1];
new_data = conv(Upsampling(data), alpha, 'same');

end
