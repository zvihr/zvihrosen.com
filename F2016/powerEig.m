A = rand(3);
[eigvecs,D] = eig(A);
eigvals = diag(D);

%Initialize a random vector for power method.
x = rand(1,3)'
err = 10;
iter = 0;
%This loop repeats the power method until the
%approximate relative error is low enough.
while err > .00001
    plot3([0,x(1)],[0,x(2)],[0,x(3)]); hold on;
    w = A*x/norm(A*x);
    err = norm(w - x)/norm(w);
    x = w;
    iter = iter + 1;
end

%eigvecs(:,1), w
%eigvals(1), norm(A*w)

