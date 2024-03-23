clc;
syms Q1(a,b) Q2(a,b) k;

%Input Q, #of nodes n
%Enter Q and k for the problem
Q1(a,b)=0;
Q2(a,b)=10;
k=0.49;
%Enter #of nodes for the problem
x=5; %assume y=x i.e. delta x= delta y


%initiallize
y=x;
theta=zeros(x,y);
theta(1,:)=0;
theta(:,1)=75;
theta(:,size(theta))=50;
theta(size(theta),:)=100;

Ans=zeros((x-2)*(y-2),1);

deltaX=1/(x-1);
deltaY=1/(y-1);
X=0:deltaX:1;
Y=0:deltaY:1;

A=zeros((x-2)*(y-2),(x-2)*(y-2));

B=zeros((x-2)*(y-2),1);

%calculation 
g=1;
for i=2:size(X,2)-1
    for j=2:size(Y,2)-1
        B(g)=-(Q1(X(i),Y(j)))*(60*deltaX)^2/k;
        g=g+1;
    end
end
B(5)=-(Q2(X((x+1)/2),Y((y+1)/2)))*(60*deltaX)^2/k;
B(1)=B(1)-75;
B(2)=B(2)-75;
B(3)=B(3)-175;
B(6)=B(6)-100;
B(7)=B(7)-50;
B(8)=B(8)-50;
B(9)=B(9)-150;

if x==5
    A=[-4 1 0 1 0 0 0 0 0;
        1 -4 1 0 1 0 0 0 0;
        0 1 -4 0 0 1 0 0 0;
        1 0 0 -4 1 0 1 0 0;
        0 1 0 1 -4 1 0 1 0;
        0 0 1 0 1 -4 0 0 1;
        0 0 0 1 0 0 -4 1 0;
        0 0 0 0 1 0 1 -4 1;
        0 0 0 0 0 1 0 1 -4;];
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

for i=1:size(X,2)
    X(i)=X(i)*60;
    Y(i)=Y(i)*60;
end

[px,py] = gradient(theta,15);
px=(-1*k).*px;
py=(-1*k).*py;


%plot
figure
contour(X,Y,theta,'ShowText','on');
title('contour plot T versus (x,y)')
xlabel('x (cm)')
ylabel('y (cm)')
grid on;
hold on;
quiver(X,Y,px,py);
hold off;