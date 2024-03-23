A=[1,2,-1;5,2,2;-3,5,-1]; % coefficient matrix
b=[4;18;2]; 

n = length(b);  
M = [A b];


for k = 1:n-1
    
    M=pivot(M,k);
    
    % Forward substitution
    for i = k+1:n
        factor = M(i,k)/M(k,k);
        M(i,k:n+1) = M(i,k:n+1) - factor*M(k,k:n+1);
    end
end

% Backward substitution
x = zeros(n,1);
x(n) = M(n,n+1)/M(n,n);
for i = n-1:-1:1
    x(i) = (M(i,n+1) - M(i,i+1:n)*x(i+1:n))/M(i,i);
end

disp(x);


function pivotted_matrix =pivot(M,k)
    n=size(M,1);
    
    [largest_element, pivot_row] = max(abs(M(k:n,k))); 
    % The pivot_row in previous line is the row# at the sub matrix M(k:n,k) 
    % not the actual matrix M

    pivot_row = pivot_row + k - 1; % This is the actule row# 
    
    % Swap row k and pivot_row
    if pivot_row ~= k
        M([k pivot_row], :) = M([pivot_row k], :);
    end

    pivotted_matrix=M;

end