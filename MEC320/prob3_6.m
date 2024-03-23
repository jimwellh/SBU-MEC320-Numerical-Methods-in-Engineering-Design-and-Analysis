trueValue=(pi^4/90);

sol_inc=0;
for i=1:1:10000
    sol_inc=sol_inc+1/(i^4);
end
sol_inc%;
true_percent_relative_error_1=(trueValue-sol_inc)/trueValue%;

sol_rev=0;
for i=10000:-1:1
    sol_rev=sol_rev+1/(i^4);
end
sol_rev%;
true_percent_relative_error_2=(trueValue-sol_rev)/trueValue%;
