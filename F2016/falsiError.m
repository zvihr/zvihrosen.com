function [zro,elapsedTime,errors,approxerrors] = falsiError(f,a,b,e,e2,tru)
X = linspace(a,b,500);
Y = arrayfun(@(x) f(x), X);
plot(X,Y,'-b',[a,b],[0,0],'-k')
hold on
tic
inc = zeros(2,0);
zrs = [];
val = 1;
errors = [];
approxerrors = [];
c = a;
while (abs(b - a) > 2*e)
    fa= f(a); fb = f(b);
    cold = c;
    c = a - fa*(b-a)/(fb- fa);
    err = abs(c - tru);
    apperr = abs(c - cold)/abs(c);
    errors = [errors err];
    approxerrors = [approxerrors apperr];
    val = f(c);  %list y values
    %fprintf('a = %d b = %d c = %d \n', a,b,c)
    plot([a,b],[f(a),f(b)],'Color','r','LineStyle','--');
    plot([c,c],[0,val],'Color','g','Marker','*');
    if abs(val) < e2
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