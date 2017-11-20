function [approx,truerr,apperr] = falsi(l,r,func,epsilon,maxSteps,rt)
%INPUT: a function func, with bracket [l,r], a.r.e. bound epsilon,
% and maximum step number maxSteps.
%OUTPUT: a point approx giving the x-value of the most
%recent approximation to the root.
new = l;
old = r;
iterCount = 0;

if nargin == 6
    truerr = [];
    apperr = [];
end

while (abs(r - l) > 2*epsilon) & ... 
        (iterCount <= maxSteps)
    %Step up the count of iterations.    
    iterCount = iterCount + 1;
    %Compute y-values for endpoints
    old = new;
    fl= func(l); fr = func(r);
    %Compute linear interpolation point and y-value
    new = l - fl*(r-l)/(fr- fl);
    val = func(new);
    %Redefine your bracket based on the sign.
    if sign(val) == sign(fl)
        l = new;
    elseif sign(val) == sign(fr)
        r = new;
    end
    if nargin == 6
        truerr = [truerr [abs(new - rt)/rt]];
        apperr = [apperr [abs(new - old)/old]];
    end
    %exit the loop if the a.r.e. is small enough.
    if ((new - old)/new <= epsilon)
        break
    end
end
approx = new;
end