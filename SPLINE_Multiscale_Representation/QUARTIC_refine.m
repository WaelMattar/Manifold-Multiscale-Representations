function new_data = QUARTIC_refine(data)

alpha = 1/16* [1 5 10 10 5 1];
new_data = conv(Upsampling(data), alpha, 'same');

end
