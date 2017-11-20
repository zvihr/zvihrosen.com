function [x, fx]=parbIntrpMin(f,x1,x2,x3,maxit)
%minimizes a function
iter = 0;
while(iter < maxit)
    fx1 = f(x1); fx2 = f(x2); fx3 = f(x3);
    numer = (x2 - x1)^2*(fx2 - fx3) - (x2 - x3)^2*(fx2 - fx1);
    denom = (x2 - x1)*(fx2 - fx3) - (x2 - x3)*(fx2 - fx1);
    xopt =  x2 - 0.5 * numer/denom;
    fxopt = f(xopt);
    if xopt > x3, x1 = x2; x2 = x3; x3 = xopt;
    else
        if xopt < x1, x3 = x2; x2 = x1; x1 = xopt;
        else
            if (xopt > x2)
                if fxopt < fx2, x1 = x2; x2 = xopt;
                else
                    x3 = xopt;
                end
            else
                if fxopt < fx2, x3 = x2; x2 = xopt;
                else
                    x1 = xopt;
                end
            end
        end
        fprintf('x1 = %f, x2 = %f, x3 = %f \n', x1,x2,x3);
        iter = iter + 1;
end
x = xopt; fx = f(xopt);

end