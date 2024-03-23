x=[0.1 5 10 20 25 30 40 45 50];
y=[0 0.18 0.5 0.69 0.64 0.47 0.35 0.315 0.28];

trapezoidalRule(x,y)


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