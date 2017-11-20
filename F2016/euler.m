%We will perform Euler's method for 
%a simple first-order differential equation.

dydx = @(x,y) -5*y;
N = 20; %N = 20; Number of steps
L = 5; %Length of interval
x = 0:L/N:L;
y = zeros(1,N+1);
y(1) = 1;
h = L/N;

for i=1:N
    y(i+1) = y(i) + h*dydx(x(i),y(i));
end
plot(x,y,'.-r')
    
   