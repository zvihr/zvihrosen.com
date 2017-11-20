%We will perform Heun's method for 
%the same differential equation.

dydx = @(x,y) -5*y;
N = 10; %N = 20; Number of steps
L = 5; %Length of interval
x = 0:L/N:L;
y = zeros(1,N+1);
y(1) = 1;
h = L/N;

for i=1:N
    for j = 1:m
    dydxtemp = 
    y(i+1) = y(i) + h*dydx(x(i),y(i));
end
plot(x,y,'.-')