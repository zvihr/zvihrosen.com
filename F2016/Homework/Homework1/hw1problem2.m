X = 0:pi/100:3*pi/2;
Y1 = cos(X);
Y2 = 1 - X.^2/factorial(2) + X.^4/factorial(4) ...
    - X.^6/factorial(6) + X.^8/factorial(8);
plot(X,Y1,X,Y2,'--k')