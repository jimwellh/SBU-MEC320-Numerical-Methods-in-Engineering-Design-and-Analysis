function [v,ea,iter] = IterMeth(x,es,maxit)
% initialization
iter = 1;
sol = 1;
ea = 100;
% iterative calculation
while (1)
 solold = sol;
 sol = sol + x ^ iter / factorial(iter);
 iter = iter + 1;
 if sol~=0
 ea=abs((sol - solold)/sol)*100;
 end
 if ea<=es | iter>=maxit,break,end
end
v = sol;
