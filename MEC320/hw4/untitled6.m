f = @(x,y) 2.25.*x.*y + 1.75.*y - 1.5.*x.^2 - 2.*y.^2;

[X,Y] = meshgrid(-1.5:0.1:1.5);
Z = f(X,Y)
s = surf(X,Y,Z,'FaceAlpha',0.5)