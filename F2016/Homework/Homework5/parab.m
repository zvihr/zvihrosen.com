function s = parab(x1,y1,x2,y2,x3,y3)
%takes three points in the plane as input
%outputs a string defining the parabola

M = [x1^2 x1 1; x2^2 x2 1; x3^2 x3 1];
V = [y1, y2, y3];
x = (M\V')';
s = sprintf('y = %f x^2 + %f x + %f',...
x(1),x(2),x(3));