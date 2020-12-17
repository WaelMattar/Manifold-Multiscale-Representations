function new_mask   =  AffineInvariant(mask)
% Stochastic normalization of the mask

S           =  sum(mask);
new_mask    =  mask/S;

end
