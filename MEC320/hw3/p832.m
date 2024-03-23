syms x;
f = 300+0.97*(0.6+0.031*sqrt(4.596*exp(17.27*16.7/273.3+16.7)))*11.7*10^(-8)*(25+273)^4-0.97*11.7*10^(-8)*(x+273)^4-0.47*(1.9+0.95*9)*(x-25)-(1.9+0.95*9)*(4.596*exp(17.27*x/273.3+x)-4.596*exp(17.27*16.7/273.3+16.7)); %Enter function
m=double.empty();
m(1)=16.7;                      %Enter initial guess
maxError=0.000001;               %Enter maximum error

f2=diff(f);
for i=1:1000
    m(i+1)=m(i)-vpa(subs(f,x,m(i)))/vpa(subs(f2,x,m(i)));
    thiserror=(m(i+1)-m(i))/m(i);
    if(abs(thiserror)<=maxError)
        break
    end
    if(i==10000)
        disp('diverage');
    end
end
fplot(f,[16.7001 16.7002]);
m(size(m,2))                   %The root found by Newton Raphson method 
vpa(subs(f,x,m(size(m,2))))    %Check if answer is close to 0