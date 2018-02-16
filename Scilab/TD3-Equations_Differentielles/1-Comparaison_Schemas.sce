clear;
function dydt = eq(t,y)     // Équation à résoudre
	dydt = -t*y + t;
endfunction
function y = f(t)           // Solution analytique pour comparer
	y = 1 - exp((-t^2)/2)
endfunction
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD3-Equations_Differentielles\0-Tous_Schemas.sce");

// Intervalle [t0 , t0+T]
t0 = 0; T = 4;
y0 = 0;

// Listes des nombre de points à tester et des pas correspondant
N = [5, 10, 22, 47, 100, 216, 465, 1000];
H = T./N;

clear eEuler eEuCau ePtMil eRunKt;

// Test des schémas avec tous les N
for i=1:length(N)
	clear ySoluc yEuler yEuCau yPtMil yRunKt;	// Sinon problème de dimension, les matrices ne sont pas réinitialisé avant
	n = N(i); h = H(i);
	t = [t0:h:T];

	// Calcul résultats de la solution analytique
	for j=1:length(t)
		ySoluc(j) = f(t(j));
	end

	// Calcul des résultats des schémas
	yEuler = Euler(y0,t,eq)';
	yEuCau = EulerCauchy(y0,t,eq)';
	yPtMil = PointMilieu(y0,t,eq)';
	yRunKt = RungeKutta(y0,t,eq)';

	// Calcul des erreurs auxquelles on applique directement log pour le graphique
	eEuler(i) = abs(log(max(abs(ySoluc - yEuler))));
	eEuCau(i) = abs(log(max(abs(ySoluc - yEuCau))));
	ePtMil(i) = abs(log(max(abs(ySoluc - yPtMil))));
	eRunKt(i) = abs(log(max(abs(ySoluc - yRunKt))));
end

x = abs(log(H'));
[pEuler, mEuler] = reglin(x', eEuler');
[pEuCau, mEuCau] = reglin(x', eEuCau');
[pPtMil, mPtMil] = reglin(x', ePtMil');
[pRunKt, mRunKt] = reglin(x', eRunKt');

// Affichage résultats pour le dernier n
scf(0); clf;
subplot(1,2,1)
plot(t',[yEuler, yEuCau, yPtMil, yRunKt, ySoluc]);
xtitle("$\huge \text{Fonction obtenues par les schémas} $", "t", "y(t)");
legend(sprintf('$\\Large \\text{Euler}$'), sprintf('$\\Large \\text{Euler-Cauchy}$'), sprintf('$\\Large \\text{Point Milieu}$'), sprintf('$\\Large \\text{Runge-Kutta}$'), sprintf('$\\Large \\text{Solution analytique}$'), 4);

// Graphique des ordres
subplot(1,2,2);
plot(x,[eEuler, eEuCau, ePtMil, eRunKt]);
xtitle("$\huge \text{Ordres des schémas} $", "log(h)", "log(e)");
legend(sprintf('$\\Large \\text{Euler : } \\alpha=%f$',pEuler), sprintf('$\\Large \\text{Euler-Cauchy : } \\alpha=%f$',pEuCau), sprintf('$\\Large \\text{Point Milieu : } \\alpha=%f$',pPtMil), sprintf('$\\Large \\text{Runge-Kutta : } \\alpha=%f$',pRunKt), 2);

