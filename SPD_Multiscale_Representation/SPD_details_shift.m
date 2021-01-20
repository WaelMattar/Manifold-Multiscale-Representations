function shifted_details = SPD_details_shift(details, index)
% Shifiting details to the right with index places

L                =  length(details);
shifted_details  =  cell(L, 1);

for k = 1 : L
    shifted_details{k}  =  details{mod(k - index, L) + 1};
end

end