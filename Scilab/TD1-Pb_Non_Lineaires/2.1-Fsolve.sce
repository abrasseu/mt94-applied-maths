function y=f(x,ite)
    y = x^2-2;
    ite = ite+1;
endfunction

function y=df(x)
    y = 2*x;
endfunction

global ite;
x0 = 1.5;
ite = 0;

// f' donnée
x1 = fsolve(x0, f, df);
disp(x1);
disp(ite);

ite = 0;
// f' approchée
x2 = fsolve(x0, f);
disp(x2);
disp(ite);

