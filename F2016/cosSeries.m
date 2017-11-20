x = pi/4;
%Use a "for" loop to calculate first 10 terms
%of the MacLaurin series
cosTerms = zeros(1,10);
for n=0:9
    cosTerms(n+1) = (-1)^(n)/factorial(2*n)*x^(2*n);
end
%Use Cumulative Sum function to get the
%cosine approxmiations.
cosApprox = cumsum(cosTerms);
y = cos(pi/4);
%List true and approximate relative errors
%for first ten approximations.
error = zeros(2,10);
error(1,:) = (cosApprox - y)/y;
for n=2:10
    error(2,n) = abs(cosApprox(n) - cosApprox(n-1))/cosApprox(n);
end
