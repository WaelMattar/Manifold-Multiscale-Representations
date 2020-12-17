function new_mask   =  AffineInvariant(mask)


L           =  length(mask);
S           =  sum(mask);
sigma       =  1 - S;
new_mask    =  zeros(L, 1);

for k = 1:L
    new_mask(k)  =  mask(k) + (mask(k)/S)*sigma;
end

end









