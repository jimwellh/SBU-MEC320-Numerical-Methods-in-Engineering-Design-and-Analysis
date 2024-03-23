% Define the function and its gradient
%f = @(x,y) 2.25*x*y + 1.75*y - 1.5*x^2 - 2*y^2;
f = @(x,y) 2.25.*x.*y + 1.75.*y - 1.5.*x.^2 - 2.*y.^2;
grad = @(x,y) [2.25*y-3*x; 2.25*x-4*y+1.75];

% Set the initial point and the convergence criteria
x0 = 1;
y0 = 1;
tol = 1e-6;
max_iter = 200;

% Find the maximum using the steepest ascent method
[x, y] = steepest_ascent(f, grad, x0, y0, tol, max_iter);
disp([x, y]);



function [xx, yy] = steepest_ascent(f, grad, x0, y0, tol, max_iter)
% Finds the maximum of the function f(x,y) using the steepest ascent method.
% Inputs:
%   f: the function to maximize
%   grad: the gradient of the function [fx; fy]
%   x0, y0: the initial point
%   tol: the tolerance for convergence
%   max_iter: the maximum number of iterations
% Outputs:
%   x, y: the coordinates of the maximum

% Initialize variables
iter = 0;
xx = x0;
yy = y0;

a=-1.5:0.1:1.5;
b=-1.5:0.1:1.5;
[B,A]=meshgrid(b,a);
F=f(A,B);

    contour(a,b,F',-13:0.1:1);
    axis equal tight;
    hold on;

% Loop until the maximum is found or the maximum number of iterations is reached
while iter < max_iter

    %Vis

    plot(xx,yy,'ok');
    drawnow;


    % Calculate the gradient at the current point
    g = grad(xx, yy);
    
    % IGNOR THIS PART Check for convergence
    if norm(g) < tol
        break
    end
    % IGNOR THIS PART
    
    % Update the point using the steepest ascent method
    syms h x y
    gh=sym(f);
    gh=subs(gh,[x y],[xx+h*g(1),yy+h*g(2)]);
    gh=matlabFunction(diff(gh,h));

    alpha = fzero(gh,xx);  % step size
    xx = xx + alpha*g(1);
    yy = yy + alpha*g(2);
    
    iter = iter + 1;

%     if iter == max_iter
%         warning('Maximum number of iterations reached')
%     end

end



end

