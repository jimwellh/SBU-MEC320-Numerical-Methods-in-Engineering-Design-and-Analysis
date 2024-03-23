% Define the objective function
objfun = @(x) 2*pi*(x(1)^2 + x(2)^2) + 2*pi*x(2)*x(3);


% Set the lower bounds for the variables
lb = [0; 0;0];

% Set the initial guess for the variables
x0 = [2; 1;1];

% Call fmincon to obtain the optimal solution
options = optimoptions('fmincon', 'Display', 'iter');
[xopt, fval] = fmincon(objfun, x0, [], [], [], [], lb, [], @nonlcon, options)

% Define the nonlinear constraint function
function [c,ceq] = nonlcon(x)
c =[];
ceq = pi*x(2)^2*x(3) + 2*pi*x(1)*(x(1)^2 + 3*x(2)^2)/6 - 0.2;
end