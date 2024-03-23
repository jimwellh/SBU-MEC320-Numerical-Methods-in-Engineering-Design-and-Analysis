% % Define the range of x and y values
% [x, y] = meshgrid(-10:0.01:10);
% % Evaluate the function at each point in the x-y grid
% z = -8.*x + x.^2. + 12.*y+4.*y.^2 - 2.*x.*y;
% % Create a 3D surface plot
% % surf(x, y, z)
% contour(x,y,z);
% grid
% % Add labels to the x, y, and z axes
% xlabel('x');
% ylabel('y');
% zlabel('z');

fun=@(x) -8*x(1) + x(1)^2+ 12*x(2)+4*x(2)^2 - 2*x(1)*x(2);

[x,fval]=fminsearch(fun,[1,0])

