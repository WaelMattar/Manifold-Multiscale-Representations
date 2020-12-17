function new_data = SPD_downsampling(data)


L      =   length(data);
if   mod(L,2) == 0
    error('Data size is even!\n');
end


new_data  =  cell((L + 1)/2, 1);

for k = 1: length(new_data)
      new_data{k}   =    data{2*k-1}; 
end

end



