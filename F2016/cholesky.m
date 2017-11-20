A = [7.102, 3.431, 5.528;
    8.412, 2.135, 1.709;
    4.047, 5.210, 8.227]

[L,U] = lu(A);
[L,U,P] = lu(A);
[L,U] = lu(sparse(A),0);
L = full(L); U = full(U);

%% What does Cholesky do, when you
%  give it an asymmetric matrix?

A = [7.102, 3.431, 5.528;
    8.412, 2.135, 1.709;
    4.047, 5.210, 8.227]
U = chol(A)

