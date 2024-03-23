clc;
syms Q(a,b);

%Input Q, #of nodes n
%Enter Q(x) for the problem
Q(a,b)=a^3.5+b^2-a^0.0015*b^0.0019;  
%Enter #of nodes for the problem
x=5; %assume y=x i.e. delta x= delta y


%initiallize
y=x;
theta=zeros(x,y);
Ans=zeros((x-2)*(y-2),1);

deltaX=1/(x-1);
deltaY=1/(y-1);
X=0:deltaX:1;
Y=0:deltaY:1;

A=zeros((x-2)*(y-2),(x-2)*(y-2));

B=zeros((x-2)*(y-2),1);

%calculation 
k=1;
for i=2:size(X,2)-1
    for j=2:size(Y,2)-1
        B(k)=-1.01*(Q(X(i),Y(j)))*deltaX^2;
        k=k+1;
    end
end

if x==4
    A=[-15 5 2.5 0;
        5 -15 0 2.5;
        2.5 0 -15 5;
        0 2.5 5 -15];
elseif x==5
    A=[-15 5 0 2.5 0 0 0 0 0;
        5 -15 5 0 2.5 0 0 0 0;
        0 5 -15 0 0 2.5 0 0 0;
        2.5 0 0 -15 5 0 2.5 0 0;
        0 2.5 0 5 -15 5 0 2.5 0;
        0 0 2.5 0 5 -15 0 0 2.5;
        0 0 0 2.5 0 0 -15 5 0;
        0 0 0 0 2.5 0 5 -15 5;
        0 0 0 0 0 2.5 0 5 -15;];
else
    disp('error');
end

Ans=A\B;

g=1;
for i=2:size(X,2)-1
    for j=2:size(Y,2)-1
        theta(j,i)=Ans(g);
        g=g+1;
    end
end

%plot
figure
contour(X,Y,theta,'ShowText','on');
title('contour plot theta versus (x,y)')
xlabel('x')
ylabel('y')
grid on;