function P = pascal(n)
%Input an integer n
%Output a matrix giving the first n rows of Pascal triangle.

P = zeros(n);
for i = 1:n
    P(i,1) = 1;
    for j = 2:i
        P(i,j) = P(i-1,j-1) + P(i-1,j);
    end
end
end
