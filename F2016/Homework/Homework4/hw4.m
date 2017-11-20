%Problem 1

f = @(x) -(4*x - 1.8*x^2 + 1.2*x^3 - 0.3*x^4);
xl = -2; xu = 4; es = .001;
[a,b,c,d] = goldmin(f,xl,xu,es,100)

[a,b] = parbIntrpMin(f,1.75,2,2.5,5)


%Problem 2

f = @(x,h,d) h/sin(x) + d/cos(x);
h = 4; d = 4;
X = fminsearch(@(x) f(x,h,d),5)

--Output: .785390625000000 approx pi/4

%Problem 3

A = [0,-6,5; 
    0, 2, 7; -4, 3, -7];
b = [50, -30, 50]';
x = A\b
A', inv(A)

%Problem 4

M = [9 0 -3 0 0; 4 -4 0 0 0;
    0 -2 9 0 0; 0 1 6 -9 2; 5 1 0 0 -6]
b = [120 0 350 0 0]'
x = M\b