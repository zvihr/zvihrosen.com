A = [1 2 ; 3 -1];
b = [2; 3];
A \ b
X = linspace(-2,5,200);
Y1 = (1/2)*(2 - X);
Y2 = (-1)*(3 - 3*X);
plot(X,Y1,X,Y2)
axis([-2 5 -2 5])


A = [1,2,3;6,5,8;3,1,4];
b = [4;7;2];
A \ b