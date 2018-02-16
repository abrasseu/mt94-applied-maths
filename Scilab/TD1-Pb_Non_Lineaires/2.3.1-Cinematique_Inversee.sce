exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD1-Pb_Non_Lineaires\dessine_bras.sce");
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD1-Pb_Non_Lineaires\1.5-NewtonRn.sce");

function Y = f(X)
    Y = [
        l1*cos(X(1)) + l2*cos(sum(X))-M(1)
        l1*sin(X(1)) + l2*sin(sum(X))-M(2)
    ];
endfunction
function Y = Jf(X)      // Jacobienne calculée
    Y = [
        -l1*sin(X(1))-l2*sin(sum(X)), -l2*sin(sum(X))
        l1*cos(X(1))-l2*cos(sum(X)),  l2*cos(sum(X))
    ];
endfunction

// Données
    l1 = 1;
    l2 = 1;
    X0 = [1; 1];  // theta0

// Affichage des mouvements successifs
scf(0); clf;
Xcercle = X0;
cercle = 1;     // Pour afficher le cercle juste la première fois
for t = linspace(0, 2*%pi, 50)
    M = [
        1+0.5*cos(t)
        1+0.5*sin(t)
    ];
    Xcercle = fsolve(Xcercle, f);
    dessine_bras(Xcercle, cercle);
    cercle = 0;
end

scf(1); clf;
X0 = [%pi/4; 0];  // theta0
M = [1; 1];  // Point objectif
[Xnewton, last] = NewtonRn(f,Jf,X0,50,1e-15)
for k=1:last-1
    dessine_bras(Xnewton(:,k), cercle);
end
