syms x 
y=-1.6*x^6-3*x^4+10*x;

x0 = 3; % initial point

fun= matlabFunction(y);

x1 = -100:0.01:100;
plot(x1,double(subs(y,x,x1)));

f2=matlabFunction(diff(y,x));

answer = fzero(f2,x0);

