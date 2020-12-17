function h  =  SPD_ellipse_plot(A, C)
%
%  Ellipse_Plot(A,C,N) plots a 2D ellipse or a 3D ellipsoid 
%  represented in the "center" form:  
%               
%                   (x-C)' A (x-C) <= 1
%  Inputs: 
%  A: a 2x2 or 3x3 matrix.
%  C: a 2D or a 3D vector which represents the center of the ellipsoid.
%  
%
%   
% Default value for number of grid points.
N = 100;

Type = '3D';

% "singular value decomposition" to extract the orientation and the
% axes of the ellipsoid

[~, D, V] = svd(A);

if strcmp(Type,'3D'),
    % generate the ellipsoid at (0,0,0)
    %----------------------------------
    a = 1/sqrt(D(1,1));
    b = 1/sqrt(D(2,2));
    c = 1/sqrt(D(3,3));
    [X,Y,Z] = ellipsoid(0,0,0,a,b,c,N);
    
    %  rotate and center the ellipsoid to the actual center point
    %------------------------------------------------------------
    XX = zeros(N+1,N+1);
    YY = zeros(N+1,N+1);
    ZZ = zeros(N+1,N+1);
    for k = 1:length(X),
        for j = 1:length(X),
            point = [X(k,j) Y(k,j) Z(k,j)]';
            P = V * point;
            XX(k,j) = P(1)+C(1);
            YY(k,j) = P(2)+C(2);
            ZZ(k,j) = P(3)+C(3);
        end
    end
end

% Plot the ellipse
%----------------------------------------
    surf(XX,YY,ZZ);
    grid on; axis equal;
    hidden off; 
    hold on;  
    V1=V(:,1); V2=V(:,2); V3=V(:,3);
    
%quiver3(C(1),C(2),C(3),V1(1)/sqrt(D(1,1)),V1(2)/sqrt(D(1,1)),V1(3)/sqrt(D(1,1)),'AutoScale','off','color','[0 0 0]');
%quiver3(C(1),C(2),C(3),V2(1)/sqrt(D(2,2)),V2(2)/sqrt(D(2,2)),V2(3)/sqrt(D(2,2)),'AutoScale','off','color','[0 0 0]');
%quiver3(C(1),C(2),C(3),V3(1)/sqrt(D(3,3)),V3(2)/sqrt(D(3,3)),V3(3)/sqrt(D(3,3)),'AutoScale','off','color','[0 0 0]');

h_surfs=findobj('Type','surface');
h = set(h_surfs(1),'FaceColor',[0.85,0.85,0.85],'EdgeColor','none','MeshStyle','both');
xlim([-1.2 1.2]);ylim([-1.2 1.2]);
axis equal; grid off; hold on;


end
