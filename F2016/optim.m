f = @(x) exp(x) - x^3 - x;
f1 = @(x) exp(x) - 3*x^2 - 1;
f2 = @(x) exp(x) - 6*x;


X = linspace(-6,6,1000);
Y = arrayfun(f,X);
plot(X,Y)
x1 = fzero(f1,1)
x2 = fzero(f1,5)
f2(x1)
f2(x2)
f(x2)


g = @(x,y) 2*x^2 + 2*y^2 - 6*x -6*y + 9;
