function [x, fx, ea, iter]=goldmin(f,xl,xu,es,maxit,varargin)

phi = (1 + sqrt(5))/2;
iter = 0;
d = (phi - 1)*(xu - xl);
x1 = xl + d; 
x2 = xu - d;
%fprintf('x1 = %f, x2 = %f \n', x1,x2);
fx1 = f(x1); fx2 = f(x2);
while(1)
    if fx1 < fx2
        xopt = x1;
        xl = x2;
        x2 = x1; fx2 = fx1;
        d = (phi - 1)*(xu - xl);
        x1 = xl + d; fx1 = f(x1);
    else
        xopt = x2;
        xu = x1;
        x1 = x2; fx1 = fx2;
        d = (phi - 1)*(xu - xl);
        x2 = xu - d; fx2 = f(x2);
    end
    fprintf('x1 = %f, x2 = %f \n', x1,x2);
    iter = iter + 1;
    if xopt ~= 0, ea = abs((xu - xl)/xopt)*100; end
    if ea <= es | iter >= maxit, break, end
end
x = xopt; fx = f(xopt);
end
