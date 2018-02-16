// A simple example with lsqrsolve 
a=[1,7;
   2,8;
   3,4;
   4,3];
b=[10;10;11;-1];

function y=f1(x, m)
  y=a*x+b;
endfunction

x0 = [100;100]
[xsol,v]=lsqrsolve(x0,f1,length(b))
xsol+a\b
