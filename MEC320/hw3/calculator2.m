
fun = @(f) 4*log10(2500)+2*log10(f)-0.4-1/sqrt(f); % function
x0 = 0.01; % initial point
fplot(fun)
x = fzero(fun,x0)

