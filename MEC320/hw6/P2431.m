syms x
f(x)=1/((0.0025*x-0.3)^2+0.01)+1/((0.0025*x-0.9)^2+0.04)-1.14;

g(x)=sqrt(1+(diff(f))^2);

xx=0:100:600;

for ii=1:size(xx,2)
    ff(ii)=g(xx(ii));
end
ff=double(ff);
L=trapezoidalRule(xx,ff)

%Trapezoidal Rule method
function intg=trapezoidalRule(x,y)
    %input checking
    if(size(x)~=size(y))
        error('Input size disagree')
    end
    %calculate the value of each minimum unit and summing all units up
    sum=0;
    for ii=2:size(x,2)
        sum=sum+(y(ii)+y(ii-1))*(x(ii)-x(ii-1))/2;
    end
    %return the result
    intg=sum;
end