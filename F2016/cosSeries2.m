x = pi/4;
y = cos(pi/4);
cosApprox = 0;
n = 0;
error = zeros(2,0);
are = 1; tre = 1;
while (are > .05)
    term = (-1)^(n)/factorial(2*n)*x^(2*n);
    cosApprox = cosApprox + term;
    tre = abs(cosApprox - y)/y;
    if n > 0
        are = abs(term)/cosApprox;
    end
    error = [error [tre; are]];
    n = n + 1;
end 