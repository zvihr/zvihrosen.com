%%
%Assignments and Boolean operators
a = 5
a = 4;
4 = a;
1stConstant = 2;
4
4 == a
a < 4
a <= 4
a >= 4

b = 'hello world';

%Which will throw an error?
c = (a == 5); 
(d == a) = 5;
%%
%Types of numbers
class(a)
e = int8(a)
class(e)

class(b)

c = 4.5;
d = 1 + i;
class(c)
class(d)

f = a + e
class(f)
b + 1

%%
%Vectors and Arrays
v1 = [1 0 2 3]
v1 = [1, 0, 2, 3]
v2 = [1; 0; 2; 3]
v1'

%Access vector coordinates
v1(0)
v1(3)

%Define a matrix or array
zeros(3)
ones(3)
rand(3)

zeros(3,4)
ones(2,3)
rand(3,5)

A = [1 0; 2 3]
A'
size(A)

%Access matrix entries
A(1,2)
A(1,:)
A(:,2)

%Generate integer sequence vectors
v3 = 1:6
v4 = -2.5:2

%and other equally spaced vectors
v5 = 7:.2:8
v6 = linspace(7,8,6)
v7 = linspace(1,i,5)

%%
%Array operations
2*A
A + 1
A + A'
%Multiply
A * A %normal matrix multiplication
A .* A %Hadamard product

%Other matrix functions
cos(A)
sqrt(A)
A < 2
arrayfun(@(a) a^3, A)
A.^3
max(v6)
mean(v1)

%Append an element to a vector
v8 = [v7 5]

%'char' is also a kind of array!
b
b(1)
int8(b)

%%
%If-then-else statements
if (a > 2)
    display(b)
end

if (a < 2), display(b), else display('hi'), end

if (a < 2), display(b), elseif (a == 2), display('elseif'), else display('else'), end



%%
%For loops
for k=1:5, display(k^2), end

%Collect the ouptut of a for loop in a vector.
L = [];
for j=0:4, L = [L j]; end
L

%%
%While loops

n = 6;
f = n;
while n > 1, n = n-1; f = f*n; end
disp(['n! = ' num2str(f)])

x = 0;
n = 0;
while (x < .8), x = rand; n = n + 1; end
n

%%
%Plots

%Basic line plot
X = 0:.05:2;
Y = cos(X);
plot(X,Y)
axis([-1,3,-1,3])
title('Part of cosine graph')

%With only one data set
plot(Y)

%Scatter plot
X = []; Y = [];
for i=1:50, X = [X rand]; Y = [Y rand]; end
plot(X,Y,'.')
plot(X,Y,'--*r')

%%Plot a matrix
Y = rand(10,3)
plot(Y)

%%
%3D Plots

%3D line plot
Z = 0:pi/50:10*pi;
Y = sin(Z);
X = cos(Z);
plot3(X,Y,Z)

%Surface in 3D
[X,Y,Z] = peaks(50);
surf(X,Y,Z)
