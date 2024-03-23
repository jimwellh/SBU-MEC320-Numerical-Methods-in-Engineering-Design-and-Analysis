trueValue= 6.737947 * 10^(-3);
x=5;

sol_1=0;
for i=0:1:19
    solold=sol_1;
    sol_1=sol_1+(-1*x)^i/factorial(i);
    ea1=abs((sol_1 - solold)/solold);
end
sol_1%;
true_percent_relative_error_1=(trueValue-sol_1)/trueValue%;
ea1%;

sol_2=0;
for i=0:1:19
    solold=sol_2;
    sol_2=sol_2+x ^ i / factorial(i);
    ea2=abs((sol_2 - solold)/solold);
end
sol_2=1/sol_2%;
true_percent_relative_error_2=(trueValue-sol_2)/trueValue%;
ea2%;