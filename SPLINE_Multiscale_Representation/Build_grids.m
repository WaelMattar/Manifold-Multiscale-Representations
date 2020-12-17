function grids = Build_grids(iter)


grids  = cell(iter, 1);
syms j;

for k = 1: iter
   grids{k}  =  linspace(0, 10, 10*2^(k-1)+1);                     % Equispacing
   if k ~= 1
   grids{k}  =  grids{k} + (1/2 - 1/2^k)* ones(1, 10*2^(k-1)+1);   % Shifting
   end
end


end