function [lim,elapsedTime] = fxdPoint(f,a,e)
%Start at point a, and do fixed point
%iteration assuming x = f(x)
%until obtaining answer with precision e
old = -100;
new = a;
tic
while(abs((old - new)/new) > e)
    old = new;
    new = f(new);
    plot([old,new],[new,f(new)],'-*');
    hold on
    fprintf('old = %d, new = %d',old,new)
end
elapsedTime = toc
lim = new;