X = [1 1 2 2 3 3]
Y = [2 3 1 3 1 2]

%a.X^2 + b.Y^2 + c.XY + d.X + e.Y + f

Z = [X.^5; X.^4.*Y; X.^3.*Y.^2; X.^2.*Y.^3; X.*Y.^4; Y.^5]'

v = [3; 2; 3; 1; 2; 1]
b = Z\v

%polynomial
[A,B] = meshgrid(0:.1:3);
ply = @(x,y) [x^5, x^4*y, x^3*y^2, x^2*y^3, x*y^4, y^5]*b;
C = arrayfun(ply,A,B);

h = surf(A,B,C)
set(h,'LineStyle','none')
hold on
plot3([1,1,2,2,3,3],[2,3,1,3,1,2],[3,2,3,1,2,1],'o')