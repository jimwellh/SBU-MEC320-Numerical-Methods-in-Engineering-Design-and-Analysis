A=[-1 2 1;3 2 0; 1 -1 0];
b=[4;14;3];
C=[3;2;0];
[optimizedXs, optimizedFunVal]=linearProg(A,b,C)



function [x, fval] = linearProg(A, b, C)
% Solves the linear programming problem using the simplex method.
% Inputs:
%   A: the coefficients of the constraints (m x n matrix)
%   b: the right sides of the constraints (m x 1 vector)
%   C: the coefficients of the objective function (1 x n vector)
% Outputs:
%   x: the optimal solution (n x 1 vector)
%   fval: the optimal value of the objective function

[m, n] = size(A);

% Add slack variables to convert inequality constraints to equality constraints
A = [A, eye(m)];
C = [C', zeros(1, m)];

% Initialize the tableau
B = [eye(m), b];
T = [-C; A, B];

% Find the entering and leaving variables using the simplex method
while any(T(1,:) < 0)
    % Find the entering variable
    [~, j] = min(T(1,:));
    
    % Find the leaving variable
    theta = T(2:m+1,n+m+1)./T(2:m+1,j);
    theta(theta <= 0) = inf;
    [~, i] = min(theta);
    
    % Update the tableau
    T(i+1,:) = T(i+1,:) / T(i+1,j);
    for k = 1:m+2
        if k ~= i+1
            T(k,:) = T(k,:) - T(k,j)*T(i+1,:);
        end
    end
end

% Extract the optimal solution and value from the tableau
x = zeros(n, 1);
for i = 1:m
    if T(i+1,n+m+1) ~= 0
        x(T(i+1,1:n) == 1) = T(i+1,n+m+1);
    end
end
fval = -T(1,n+m+1);
end
