exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD1-Pb_Non_Lineaires\dessine_bras.sce");

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
X = [1; 1];

// Affichage des mouvements successifs
NB_POSITIONS = 50;
myColor = jetcolormap(NB_POSITIONS);
t = linspace(0, 2*%pi, NB_POSITIONS)
clf;
for i=1:NB_POSITIONS
    M = [
        1+0.5*cos(t(i))
        1+0.5*sin(t(i))
    ];
    X = fsolve(X, f);
    dessine_bras(X, 1, myColor(i,:));
end
