X = [0:.001:1];
Y = sin(X.^3 + .45* X.^2 - 2.5*X + 1.2);
L = zeros(1,1001);
plot(X,Y,X,L,'r--');
axis([0,1,-1,1])

%Incremental Search Method

increment(@(x) x^3 + .45*x^2 - 2.5*x + 1.2, 0, 1, 100)

%Bisection Method


