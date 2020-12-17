function new_data = SPD_GIM(data, w)
% Status: DONE.
%-----------------------------------------------------%
% Given SPD-valued data and vector of weights w,
% the function calculates the geodesic inductive mean.
% Note than w must be decreasingly sorted.
%-------------------function--------------------------%

L    = length(w);
D    = length(data);

%if   vpa(sum(w)) ~= vpa(1)
%    error('Problem in Affine Invariance, the weights do not sum to 1.');
%end 

if   D ~= L
    error('Data and weights sizes aren''t equal.');
end

[w,sortIdx] = sort(w,'descend');
data = data(sortIdx);

if L == 2;
    new_data =   SPD_av_g(w(2), data{1}, data{2});
else
    new_data =   SPD_av_g(w(L), SPD_GIM(data(1:L-1), 1/(1 - w(L))* w(1: L-1) ), data{L});
end

end



