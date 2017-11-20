fun = @(x)100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
x0 = [-1.2,1];
options = optimset('Display','iter','PlotFcns',@optimplotx);
[x,fval,exitflag,output] = fminsearch(fun,x0,options)
