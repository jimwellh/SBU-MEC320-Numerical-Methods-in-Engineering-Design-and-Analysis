T = flip(UntitledspreadsheetSheet1);
T=T{:,:};
X=0:60/(7-1):60;
Y=X;


[px,py] = gradient(T,10);
px=(-1*k).*px;
py=(-1*k).*py;

%plot
figure
contour(X,Y,T,'ShowText','on');
title('contour plot T versus (x,y)')
xlabel('x (cm)')
ylabel('y (cm)')
grid on;
hold on;
quiver(X,Y,px,py);
hold off;
