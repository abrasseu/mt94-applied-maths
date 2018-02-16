function Y=f(X, coeffPoly)
    p = X(1);
    q = X(2);
    r = X(3);
    s = X(4);
    a = coeffPoly(1);
    b = coeffPoly(2);
    c = coeffPoly(3);
    d = coeffPoly(4);
    Y = [   p+r-a;
            p*r+s+q-b;
            q*r+p*s-c;
            q*s-d
            ];
endfunction

x0 = [1;1;1;1];
coeffPoly = [0;-1;-2;-1];
y = fsolve(x0, f)


r(x) = []
