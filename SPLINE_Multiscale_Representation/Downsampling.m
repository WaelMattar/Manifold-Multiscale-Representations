function new_data = Downsampling(data) 
% Downsampling points - taking every other element

L          =    length(data);
new_data   =    zeros((L + 1)/2, 1);
  
for k = 1: length(new_data)
      new_data(k)   =   data(2*k-1);
end
     
new_data=new_data.';

end
