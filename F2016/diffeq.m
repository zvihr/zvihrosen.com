syms y(t)
syms a
syms b

dsolve(diff(y) ==  a - b*y^2)
