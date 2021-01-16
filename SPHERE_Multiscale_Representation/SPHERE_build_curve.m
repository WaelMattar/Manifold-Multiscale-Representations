function data = SPHERE_build_curve(density)
% Building and sampling a sphere-valued curve

theta     =   linspace(0, 2*pi, density);
mag       =   pi/16;
leaf      =   5;
phi       =   mag * cos(theta.*leaf) + pi/6;

x_curve    = sin(phi).*cos(theta); y_curve    = sin(phi).*sin(theta); z_curve    = cos(phi);

data  =  horzcat(x_curve.', y_curve.', z_curve.');

end

