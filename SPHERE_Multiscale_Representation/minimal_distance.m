function d = minimal_distance(point)
% Measuring the minimal distance between a sphere-valued point and the
% ground-truth curve

num_of_samples  =  2000;
curve           =  SPHERE_build_curve(num_of_samples);
displacement    =  cell(num_of_samples, 1);
distances       =  zeros(num_of_samples, 1);

for k = 1: num_of_samples
  displacement{k} =  SPHERE_Log(curve(k, :), point);
  distances(k)    =  norm(displacement{k}, 2)^2;
end

d = min(distances);

end

