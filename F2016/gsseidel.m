%Example of symmetric positive definite matrix
X = rand(10); A = X'*X;
b = rand(1,10)';
z = A\b;
y = GaussSeidel(A,b);

pause;

%Example of diagonally dominant matrix
A2 = rand(4) + 4*eye(4);
b2 = rand(1,4)';
z2 = A2\b2;
y2 = GaussSeidel(A2,b2);

