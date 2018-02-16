function y=f(x)     // ecart annulation f
    y = x^2 - 2;
endfunction

// Constantes de vérification d'arrêt
ITMAX=1000;
EPS=1e-10;

// bornes initales => bien choisir
a=1;
b=2;
x=(a+b)/2;      //x0



for k=1:ITMAX
    // Arret précision
    if (abs(f(x))<EPS)
        break;
    end

    // Code Méthode

    // Calcul erreur -> purement académique car on connait la soluce
    e(k)=abs(x-sqrt(2));

end

disp(x);    // résultat
disp(k);    // itérations
clf;
plot(e, 'ro-');    // graphe erreur
