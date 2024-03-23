
eps=0.05;


syms x1 x2 x3 xa xb xc

xa=(22-2*x2+x3)/10;
xb=(-14+3*x1-2*x3)/(-6);
xc=(14-x1-x2)/5;

x=[0,0,0];


for iter=1:1000
    x_old = x;

    x(1)=double(subs(xa,[x2 x3],[x(2),x(3)]));
    x(2)=double(subs(xb,[x1 x3],[x(1),x(3)]));
    x(3)=double(subs(xc,[x1 x2],[x(1),x(2)]));

    disp(iter);
    disp(x);
    disp(norm(x-x_old));
   

    if norm(x-x_old) < eps
        break;
    end
    
    

    % Output warning message if maximum iterations reached
    if iter == 1000
     warning('diverge');
    end

end
disp(x);
