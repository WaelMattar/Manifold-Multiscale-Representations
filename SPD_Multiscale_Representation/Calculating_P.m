
clear;
close all;

n       =   6;
data    =   SPD_build_curve(n);

for k = 1: length(data)-1
    distances(k)  =  norm(SPD_Log(data{k}, data{k+1}), 'fro');
end

delta_c =  max(distances);

decimated_data    =  SPD_cubic_decimate(data);

for k = 1: length(decimated_data)-1
    decimated_distances(k)  =  norm(SPD_Log(decimated_data{k}, decimated_data{k+1}), 'fro');
end

delta_y_c =  max(decimated_distances);

minimal_P = delta_y_c / (2 * delta_c);

