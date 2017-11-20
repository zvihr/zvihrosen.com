function [theta,c,mag] = dotCross(a,b)
%Input: two vectors in R^3
%Output: the angle between them, the cross
%product, and the magnitude of the cross product.
theta = acos(sum(a.*b)/(mgd(a)*mgd(b)));
c = crossP(a,b);
mag = mgd(c);
A = [zeros(1,3);a];
B = [zeros(1,3);b];
C = [zeros(1,3);c];
plot3(A(:,1),A(:,2),A(:,3),'--',...
    B(:,1),B(:,2),B(:,3),'--',...
    C(:,1),C(:,2),C(:,3));
end

function x = mgd(v)
%Input: vector
%Output: magnitude of the vector
x = sqrt(sum(v.^2));
end

function w = crossP(a,b)
%Input: pair of vectors
%Output: cross product of vectors.
m = [a;b];
w = [det([m(:,2) m(:,3)]),...
    -det([m(:,1) m(:,3)]),...
    det([m(:,1) m(:,2)])];
end

