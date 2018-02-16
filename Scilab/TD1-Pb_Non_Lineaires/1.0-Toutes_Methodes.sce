function y=f(x)		// Fonction à annuler
    y = x^2 - 2;
endfunction
function y=df(x)	// f'
    y = 2*x;
endfunction
function y=g(x)		// Point fixe
    y = (x+2)/(x+1);
endfunction
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD1-Pb_Non_Lineaires\1.0-Methodes.sce");

// Paramètres
ITE_MAX = 50; EPS = 1e-10;
a = 1; b = 2;
x0 = (a+b)/2;
solution = sqrt(2);

// Résultats
[Dich, ite(1)] = Dichotomie(f,a,b,ITE_MAX,EPS);
[PtFx, ite(2)] = PointFixe(f,g,x0,ITE_MAX,EPS);
[Nwtn, ite(3)] = Newton(f,df,x0,ITE_MAX,EPS);
[Scte, ite(4)] = Secante(f,a,b,ITE_MAX,EPS);

// Erreurs
errDich = abs(Dich-solution);
errPtFx = abs(PtFx-solution);
errNwtn = abs(Nwtn-solution);
errScte = abs(Scte-solution);

// Ordres
[alpha(1), C(1)] = reglin(log(errDich(1:$-1))',log(errDich(2:$))');
[alpha(2), C(2)] = reglin(log(errPtFx(1:$-1))',log(errPtFx(2:$))');
[alpha(3), C(3)] = reglin(log(errNwtn(1:$-2))',log(errNwtn(2:$-1))');
[alpha(4), C(4)] = reglin(log(errScte(1:$-2))',log(errScte(2:$-1))');
X = 0:2; ordres = alpha*X + repmat(C, 1, length(X));

// Remplissage des résulats avec la dernière approximation  pour l'affichage
maxIte = max(ite);
Dich($+1:maxIte) = Dich($); errDich($+1:maxIte) = errDich($);
PtFx($+1:maxIte) = PtFx($); errPtFx($+1:maxIte) = errPtFx($);
Nwtn($+1:maxIte) = Nwtn($); errNwtn($+1:maxIte) = errNwtn($);
Scte($+1:maxIte) = Scte($); errScte($+1:maxIte) = errScte($);

// Approximation
scf(0); clf; subplot(1,2,1);
plot((1:maxIte)', [Dich, PtFx, Nwtn, Scte]);
plot(ite', [Dich(ite(1)), PtFx(ite(2)), Nwtn(ite(3)), Scte(ite(4))], 'kx'); // Derniers résulats
title("$\huge \text{Approximation de la solution}$");
xlabel("Itération"); ylabel("Approximation");
legend("Dichotomie", "Point Fixe", "Newton", "Secante");
legend(sprintf('$\\Large \\text{Dichotomie : } k=%d$',ite(1)), sprintf('$\\Large \\text{Point Fixe : } k=%d$',ite(2)), sprintf('$\\Large \\text{Newton : } k=%d$',ite(3)), sprintf('$\\Large \\text{Sécante : } k=%d$',ite(4)));

// Erreur
subplot(1,2,2);
plot((1:maxIte)', log([errDich, errPtFx, errNwtn, errScte] +1));
title("$\huge \text{Erreur}$");
xlabel("Itération"); ylabel("Erreur (logarithme)");
legend("$\Large \text{Dichotomie}$", "$\Large \text{Point Fixe}$", "$\Large \text{Newton}$", "$\Large \text{Secante}$");

// Ordres
scf(1); clf;
plot(X', ordres');
title("$\huge \text{Ordre des méthodes}$");
legend(sprintf('$\\Large \\text{Dichotomie : } \\alpha=%f$',alpha(1)), sprintf('$\\Large \\text{Point Fixe : } \\alpha=%f$',alpha(2)), sprintf('$\\Large \\text{Newton : } \\alpha=%f$',alpha(3)), sprintf('$\\Large \\text{Sécante : } \\alpha=%f$',alpha(4)), 2);
