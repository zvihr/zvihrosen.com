#using Lagrange multipliers to find a matrix completion
#that minimizes the Pearson chi-squared distance from the uniform distribution
with(LinearAlgebra); Digits:=30;

#define basic functions
S:=(a)->add(sqrt(a[i]),i=1..3);
u:=(i,a,t)->sqrt(a[i])/S(a)+t[i];
v:=(i,a,t)->a[i]/u(i,a,t);
g:=(a,t)->-1+add(v(i,a,t),i=1..3);
p:=(i,j,a,t)->u(i,a,t)*v(j,a,t);

#Pearson chi-squared statistic function
f:=(a,t)->add(add((p(i,j,a,t)-1/9)^2/(1/9),i=1..3),j=1..3);

#partial matrix data
a1:=1/4;
a2:=1/25;
a3:=1/36;
a:=Array([a1,a2,a3]);
t:=Array([t1,t2,-t1-t2]);

#partial derivatives for g
m11:=diff(g(a,t),t[1]);
m12:=diff(g(a,t),t[2]);

#partial derivatives for f
m21:=diff(f(a,t),t[1]);
m22:=diff(f(a,t),t[2]);
M:=Matrix([[m11,m12],[m21,m22]]);
s:=solve({Determinant(M),g(a,t)},{t1,t2});
ss:=evalf(allvalues(s));

#print out u's for all critical points and
#construct a vector that records if a solution is feasible 
#(real and nonnegative)
feasibleSolutions:=Vector(nops([ss]));
for i from 1 to nops([ss]) do
   for j from 1 to 3 do
      x[j]:=eval(u(j,a,t),ss[i]);
      y[j]:=eval(v(j,a,t),ss[i]);
   end do;
   feasibleSolutions[i]:=evalb(
       type(x[1],float) and type(x[2],float) and type(x[3],float) 
       and evalb(x[1]>0) and evalb(x[2]>0) and evalb(x[3]>0));
   print(i,x[1],x[2],x[3]);
end do;

#print matrices corresponding to feasible critical points and
#their chi-squared values
for k from 1 to nops([ss]) do 
  if feasibleSolutions[k] then  
     P:=Matrix(3,3):
     mySum:=0:
     for i from 1 to 3 do
        for j from 1 to 3 do
        P[i,j]:=eval(p(i,j,a,t),ss[k]);
        mySum:=mySum+P[i,j];
        end do;
     end do;
     print(P);
     print(number among all the solutions,k);
     print(sum of elements, mySum);
     print(function value, eval(f(a,t),ss[k]));
  end if;
end do;  
