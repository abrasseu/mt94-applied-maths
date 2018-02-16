function debugJacob()
// ========== VERIFICATION JACOBIENNE ==========
    Jth = Jf(X);
    Jex = numderivative(f, X);
    ecartJ = abs(Jth-Jex)./(Jth); // Ecart relatif th / exp

    disp(Jth, "Jacobienne théorique");
    disp(Jex, "Jacobienne approchée");
    disp(ecartJ, "Ecart relatif Jth par rapport à Jexp:");
endfunction

function debugNewton(Xn)
// ========== MÉTHODE DE NEWTON ==========
    // Constantes de vérification d'arrêt
    ITMAX=1000;
    EPS=1e-10;

    for k=1:ITMAX
        // Arret précision
        if (abs(f(X))<EPS)
            break;
        end

        // Code Méthode
         Xn = Xn - Jf(Xn)\f(Xn);
    end

// ========== ECART ET AFFICHAGE ==========    
    disp(Xn, "Résulat NEWTON");
    disp(k, "Nb itérations");

    // FSOLVE AVEC JACOBIENNE
    XfJ = fsolve(X, f, Jf);
    ecartXJ = abs(Xn-XfJ)./(Xn);
    disp(XfJ, "Résulat FSOLVE avec Jacobienne");
    disp(ecartXJ, "Ecart relatif par rapport à fsolve avec J");

    // FSOLVE 
    Xf = fsolve(X, f);
    ecartX = abs(Xn-Xf)./(Xn);
    disp(Xf, "Résulat FSOLVE sans");
    disp(ecartX, "Ecart relatif par rapport à fsolve");
endfunction
