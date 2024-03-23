f = @(x) 6+10*x+9*x^2+16*x^3;
xl = -2;
xr = 1;
tol = 0.00005;
max_iter = 100;

root = bisection(f, xl, xr, tol, max_iter);
disp(root);


function root = bisection(f, xl, xr, tol, max_iter)

    % Initialize variables
    iter = 0;
    c = (xl+xr)/2;
    
    while abs(f(c)) > tol && iter < max_iter
        iter = iter + 1;
        if f(xl)*f(c) < 0
            xr = c;
        else
            xl = c;
        end
        c = (xl+xr)/2;
    
        if iter == max_iter
        warning('diverge');
        end
    
    end
    
    root = c;
end
