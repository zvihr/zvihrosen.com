func = @(x,y) 10*x^2+4*x*y-32*x+2*y^2-8*y+23
x0 = 
[x,fval,exitflag,output] = fminsearch(func,x0,options)
