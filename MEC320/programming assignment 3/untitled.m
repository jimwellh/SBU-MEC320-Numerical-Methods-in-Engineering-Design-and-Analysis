F = [0, 30, 40, 40, 50, 50, 60, 80, 100];
z = [0, 50, 100, 150, 225, 300, 375, 450, 600];

odd=0;
even=0;
n=size(F,2);

for j=2:2:size(F,2)-1
    odd = odd + 4*F(j);
end
for j=3:2:size(F,2)-2
    even = even + 2*F(j+1);
end
 I_simp=(even + odd + F(1)+ F(n))*(z(n)-z(1))/(size(F,2)-1)/3;
display(I_simp)