%Representative Statistics Example

X = randn(1,100);
histogram(X,15)
mode(X)
mean(X)
median(X)

%Regression Example
X = randn(1,100);
Y = 4 + 2*X + randn(1,100);

fitlm(X,Y)

Lx = [-3,3]
Ly = 3.8852 + 1.9227*Lx

plot(X,Y,'.',Lx,Ly);
