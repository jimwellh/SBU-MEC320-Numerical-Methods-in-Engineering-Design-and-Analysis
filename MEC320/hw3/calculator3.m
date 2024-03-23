syms x;
f = 1/12*x*(cosh(600/x)-1)-9; %Enter function
m=double.empty();
m(1)=99;                      %Enter initial guess
maxError=0.001;               %Enter maximum error

f2=diff(f)
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

m(size(m,2))                   %The root found by  
vpa(subs(f,x,m(size(m,2))))    %Check if answer is close to 0