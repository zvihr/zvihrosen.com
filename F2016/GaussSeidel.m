function x = GaussSeidel(A,b,lambda,es,maxit)

if nargin<2, error('at least 2 input arguments required'),end
if nargin<4|isempty(maxit),maxit=6; end
if nargin<3|isempty(es),es=0.0001;end
if nargin<3|isempty(lambda),lambda = 1;end

[m,n]=size(A);
if m ~= n, error('Matrix A must be square'); end
C = A;
x = zeros(1,n);
for i = 1:n
    C(i,i) = 0;
    x(i) = 0;
end
x = x';
for i =1:n
    C(i,1:n) = C(i,1:n)/A(i,i);
end
for i = 1:n
    d(i) = b(i)/A(i,i);
end
iter = 0;
while (1)
    xold = x;
    for i = 1:n
        x(i) = lambda*(d(i) - C(i,:)*x) + (1-lambda)*xold(i);
        if x(i) ~= 0
            ea(i) = abs((x(i) - xold(i))/x(i)) * 100;
        end
    end
    plot([xold(1),x(1)],[xold(2),x(2)],'.-');
    hold on
    %text(x(1),x(2),num2str(iter));
    iter = iter + 1; %disp(x); pause(1);
    if max(ea) <= es | iter >= maxit, break, end
    %if iter >= maxit, break, end
end
disp(iter)
end
