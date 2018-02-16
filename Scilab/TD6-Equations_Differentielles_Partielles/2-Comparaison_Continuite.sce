exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD6-Equations_Differentielles_Partielles\0-Calcul_Serie.sce");
// Différents coefficients des fonctions fi
function y = a1(x,n,T)
	y = 1/(4*%pi^2 * n^2);
endfunction
function y = b1(x,n,T)
	y = 1/(4*%pi*n);
endfunction

function y = a2(x,n,T)
	y = 1/(%pi^2 *n^2);
endfunction

function y = b3(x,n,T)
	y = 4*((-1)^n -1)/(%pi^3 * n^3);
endfunction

NB_POINTS = 400;
NB_ITE = 5;
XMIN = 0;
XMAX = 1/2;

x = linspace(XMIN,XMAX, NB_POINTS);
f = x.*(x-1);

// Calcul des séries
S1 = serie(-1/3, a1, b1, x, 1/2, NB_ITE);
S2 = serie(-1/3, a2, 0, x, 1, NB_ITE);
S3 = serie(0, 0, b3, x, 2, NB_ITE);

// Calcul des écarts
ecarts = zeros(3, NB_POINTS);
ecarts(1,:) = abs(f-S1);
ecarts(2,:) = abs(f-S2);
ecarts(3,:) = abs(f-S3);

clf; subplot(2,1,1);
plot(x', [S1; S2; S3; f]');
legend("Série f1", "Série f2", "Série f3", "Fonction originale");
title("Séries");

subplot(2,1,2);
plot(x', ecarts');
legend("Série f1", "Série f2", "Série f3");
title("Écarts entre la fonction f et les séries");

erreurMoy = [
    mean(ecarts(1,:));
    mean(ecarts(2,:));
    mean(ecarts(3,:));
]
disp(erreurMoy, "L erreur moyenne de chaque série est : ");
