function b = brent(f,xl,xu)
%Takes in xl, xu, and f
%sets (x,y) on left and right
a = xl; b= xu; fa = f(a); fb = f(b);
%takes third point c, sets as left
%sets d to length of bracket
c = a; fc = fa; d = b-c; e = d;
X = linspace(a,b,500);
Y = arrayfun(@(x) f(x), X);
plot(X,Y);
hold on
drawnow
text([a],[-.01],'a')
text([b],[-.01],'b')
text([c],[-.01],'c')
k = 1;
while (1)
    %if value at b is zero, done.
    if fb == 0, break, end
    %if signs at a,b are same, push a to c.
    if sign(fa) == sign(fb)
        a = c; fa = fc; d = b-c; e = d;
    end
    %if y value at a is smaller than y value at b
    %push c to b, b to a, a to c. Now f(a) > f(b).
    if abs(fa) < abs(fb)
        c = b; b = a; a =c;
        fc = fb; fb = fa; fa = fc;
    end
    m = 0.5*(a-b); %set m to half interval length;
    %if interval is small enough, end.
    tol = 2*eps*max(abs(b),1);
    if abs(m) <= tol | fb == 0.
        break
    end
    %Choose open method or bisection
    %loop executes if abs f(a) > abs f(c) > abs f(b)
    if abs(e) >= tol & abs(fc) > abs(fb)
        s = fb/fc;  %set s to be ratio of f(b)/f(c)
        if  a==c %Only have two points, so use secant.
            p = 2*m*s; %set p = (a-b)*f(b)/f(c)
            q = 1-s; %set q to be [f(c) - f(b)]/f(c)
        else %Have three points a,b,c, use inverse quadratic.
            q = fc/fa; r = fb/fa; %set q to be f(c)/f(a)
            p = s * (2*m*q *(q-r) - (b-c)*(r-1));
            q = (q-1)*(r-1)*(s-1);
        end
        if p > 0, q = -q; else p = -p; end; %adjust sign
        if 2*p < 3*m*q - abs(tol*q) & p < abs(0.5*e*q)
            e = d; d = p/q;
            %e is interval length, d = distance from b to new pt.
        else %Bisection.
            d = m; e = m; %set both d and e to midpoint.
        end
    else
        d =m ; e=m;
    end
    c = b; fc = fb;
    if abs(d) > tol, b=b+d; else b =b-sign(b-a)*tol; end
    fb = f(b);
    stra = sprintf('a %d',k);
    strb = sprintf('b %d',k);
    strc = sprintf('c %d',k);
    text([a],[-.01-.12*k],stra);
    text([b],[-.01-.12*k],strb);
    text([c],[-.02-.12*k],strc);
    drawnow
    k = k + 1;
end
end
        