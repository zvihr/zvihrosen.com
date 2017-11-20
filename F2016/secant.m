function approx = secant(x0,x1,func,epsilon,maxSteps)
%INPUT: a function func, with two approximations, 
%a.r.e. bound epsilon, and maximum step number maxSteps.
%OUTPUT: a point approx giving the x-value of the most
%recent approximation to the root.
new = x1;
old = x0;
iterCount = 0;

%Define a points matrix to gather
%the sequence of iterations.
pts = [old new];

while (iterCount <= maxSteps)
    %Step up the count of iterations.    
    iterCount = iterCount + 1;
    %Compute y-values for two points
    f1= func(new); f2 = func(old);
    %Compute linear interpolation point and y-value
    mid = new - f1*(new-old)/(f1 - f2);
    old = new;
    new = mid;
    pts = [pts new];
    %exit the loop if the a.r.e. is small enough.
    if (abs(new - old)/abs(new) <= epsilon)
        break
    end
end
approx = new;
X = linspace(min(pts)-.1,max(pts)+.1,500);
Y = arrayfun(func, X);
plot(X,Y,'-k');
hold on
plot(X,zeros(1,500),'-k');
fpts = arrayfun(func, pts);
for i=3:length(pts)
    plot(pts(i-2:i),[fpts(i-2),fpts(i-1),0],'r')
    plot([pts(i),pts(i)],[0,fpts(i)],'--b')
end
axis([min(X),max(X),min(Y),max(Y)]);
end
