//function y = f(x,A,b)
//    y = .5*x'*A*x-b'*x;
//endfunction

function plotIso(xk)
    xc = A\b;
    [D,P] = bdiag(A); // Val propre et vec
    d = diag(D);

    c = f(xk)-f(xc);
    a = sqrt(2*c/d(1));
    b = sqrt(2*c/d(2));
    N = 128;
    t = linspace(0,2*%pi,N);
    x = P*[a*cos(t);b*sin(t)]+xc(:,ones(1,N));
    set(gca(), "isoview", "on");
    plot(x(1,:),x(2,:))
endfunction

// Inputs
//A = [2 -1; -1 2];
//b = [1; 1];
//x0 = [1; 0];

// Calculs préalables à mettre dans la fonction ??
//xc = A\b;
//[D,P] = bdiag(A); // Val propre et vec
//d = diag(D);

// Exemple d'utilisation
//plotIso([1;0])
//plotIso([1;0.5])
//plotIso([1;.99])
