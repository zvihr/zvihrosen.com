function approx = falsi2(l,r,func,epsilon,maxSteps)
%INPUT: a function func, with bracket [l,r], a.r.e. bound epsilon,
% and maximum step number maxSteps.
%OUTPUT: a point approx giving the x-value of the most
%recent approximation to the root.
X = linspace(a,b,500);
Y = arrayfun(@(x) f(x), X);
plot(X,Y,'-b',[a,b],[0,0],'-k')
hold on
tic
inc = zeros(2,0);
zrs = [];
val = 1;
F = [];
while (abs(b - a) > 2*e) 
    %Compute y-values for endpoints
    fa= f(a); fb = f(b);
    %Compute linear interpolation point and y-value
    c = a - fa*(b-a)/(fb- fa);
    val = f(c);  %list y values
    plot([a,b],[f(a),f(b)],'Color','r','LineStyle','--');
    plot([c,c],[0,val],'Color','g','Marker','*');
    if c -  < e2
        break
    elseif sign(val) == sign(fa)
        a = c;
    elseif sign(val) == sign(fb)
        b = c;
    end
end
if val < e2
    zro = c;
else
    zro = [a b];
end
elapsedTime = toc
end