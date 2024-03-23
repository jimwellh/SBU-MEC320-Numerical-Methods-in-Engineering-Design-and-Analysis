clc;
syms Q(x);


%Input Q, #of nodes n
%Enter Q(x) for the problem
Q(x)=sqrt((1+2*x)^(exp(1)-sin(x)*cos(2.3*x)))+1.113*sin(2.7*x)+(exp(x-sin(x)))^(x+0.007*x);   
%Enter #of nodes for the problem
n=11;        

%initiallize
theta=zeros(n,1);

deltaX=1/(n-1);
X=0:deltaX:1;

B=zeros(n-2,1);

A=zeros(n-2,n-2);

%calculation 
A(1,1)=-2;
A(n-2,n-2)=-2;
A(n-3,n-2)=1;
A(n-2,n-3)=1;
A(1,2)=1;
A(2,1)=1;
for i=2:size(A,1)-1
    for j=2:size(A,2)-1
        A(i,j)=-2;
    end
    A(i,i+1)=1;
    A(i-1,i)=1;
end

for i=1:size(B)
    B(i)=(-1.2*(deltaX^2)*Q(X(i+1)))/1.045;
end
B(size(B,1))=B(size(B,1))-1;

%Ans(1)=theta(node 2), Ans(2)=theta(node 3)...Ans(n-1)=theta(node n)
Ans=A\B;
theta(1)=0;
theta(n)=1;
for i=1:size(Ans)
    theta(i+1)=Ans(i);
end

%plot theta versus x
figure
plot(X,theta,'-o')

title('theta versus x')
xlabel('x')
ylabel('theta')
