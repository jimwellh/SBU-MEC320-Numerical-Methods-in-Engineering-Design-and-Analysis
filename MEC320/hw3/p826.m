 fun = @t exp(t*10^-13)*erfc(0.000393*t^0.5)/0.405syms y(x,a,n)
y(x,a,n)=piecewise(x >a,(x-a)^n,x <= a,0);
V(x)=20*(y(x,0,1)-y(x,5,1))-15*y(x,8,0)-57;

fun = @(x) V(x); % function
x0 = 2.85; % initial point
fplot(fun)
x = fzero(fun,x0)

vpa(subs(V,x,2.85))
