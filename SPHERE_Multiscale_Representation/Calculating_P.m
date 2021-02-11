
clear;
close all;

n       =   6;
data    =   SPHERE_build_curve(10*2^(n-1)+1);

for k = 1: length(data)-1
    distances(k)  =  norm(SPHERE_Log(data(k, :), data(k+1, :)));
end

delta_c =  max(distances);

decimated_data    =  SPHERE_cubic_decimate(data);

for k = 1: length(decimated_data)-1
    decimated_distances(k)  =  norm(SPHERE_Log(decimated_data(k, :), decimated_data(k+1, :)));
end

delta_y_c =  max(decimated_distances);

minimal_P = delta_y_c / (2 * delta_c);

