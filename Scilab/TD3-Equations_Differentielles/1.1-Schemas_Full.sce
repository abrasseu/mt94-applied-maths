// Équation à résoudre
function dydt = eq(t,y)
    dydt = -t*y + t;
endfunction

// Solution analytique pour comparer
function y = f(t)
    y = 1-exp((-t^2)/2)
endfunction

// Arg des schémas : y0 entier, t vecteur de discretisation de l'intervalle [t0, t0+T] et f l'équation à résoudre

// Schéma de Euler
function y=Euler(y0,t,f)
	n = length(t);
	h = t(2)-t(1);
	y(1) = y0;

	for i=1:n-1
		y(i+1) = y(i) + h*f(t(i), y(i));
	end
endfunction

// Schéma de Euler-Cauchy
function y=EulerCauchy(y0,t,f)
	n = length(t);
	h = t(2)-t(1);
	y(1) = y0;

	for i=1:n-1
		k1 = f(t(i), y(i));
		k2 = f(t(i) + h, y(i) + h*k1);
		y(i+1) = y(i) + h*(k1 + k2)/2;
	end
endfunction

// Schéma du Point Milieu
function y=PointMilieu(y0,t,f)
	n = length(t);
	h = t(2)-t(1);
	y(1) = y0;

	for i=1:n-1
		k1 = f(t(i), y(i));
		k2 = f(t(i)+h/2, y(i) + (h*k1)/2);
		y(i+1) = y(i) + h*k2;
	end
endfunction

// Schéma de Runge-Kutta
function y=RungeKutta(y0,t,f)
	n = length(t);
	h = t(2)-t(1);
	y(1) = y0;

	for i=1:n-1
		k1 = f( t(i),     y(i));
		k2 = f( t(i)+h/2, y(i) + (h*k1)/2);
		k3 = f( t(i)+h/2, y(i) + (h*k2)/2);
		k4 = f( t(i)+h,   y(i) + h*k3);
		y(i+1) = y(i) + h*(k1+2*k2+2*k3+k4)/6;
	end
endfunction

// ==================================================
// ==================================================


// Intervalle [t0 , t0+T]
t0 = 0;
T=4;
y0 = 0;

// n = 20;           // Nombre de points
// h = T/n;
//1,3,5,
N = [10,22,47,100,216,465,1000];
H = T./N;


clear eEuler eEulerCauchy ePointMilieu eRungeKutta;

for i=1:length(N)
    // Sinon problème de dimension, les matrices ne sont pas réinitialisé avant
	clear Y YEuler YEulerCauchy YPointMilieu YRungeKutta;

	n = N(i);
	h = H(i);
	t = [t0:h:T]';

	// Calcul résultats de la solution analytique
	for j=1:length(t)
		Y(j)=f(t(j));
	end

	// Calcul des résultats des schémas
	YEuler = Euler(y0,t,eq);
	YEulerCauchy = EulerCauchy(y0,t,eq);
	YPointMilieu = PointMilieu(y0,t,eq);
	YRungeKutta = RungeKutta(y0,t,eq);

    // Calcul des erreurs auxquelles on applique directement log pour le graphique suivant
	eEuler(i) = abs(log(max(abs(Y - YEuler))));
	eEulerCauchy(i) = abs(log(max(abs(Y - YEulerCauchy))));
	ePointMilieu(i) = abs(log(max(abs(Y - YPointMilieu))));
	eRungeKutta(i) = abs(log(max(abs(Y - YRungeKutta))));

end

figure(0);
clf;
x = abs(log(H'));
// Affichage résultats
plot(t,[Y,YEuler, YEulerCauchy, YPointMilieu, YRungeKutta]);

figure(1);
clf;
// Graphique des ordres
plot(x,[eEuler, eEulerCauchy, ePointMilieu, eRungeKutta]);
xtitle("Ordre des schémas", "log(h)", "log(e)");
legend("Euler", "Euler-Cauchy", "Point Milieu", "Runge-Kutta");

[pEuler, mEuler] = reglin(x', eEuler');
[pEulerCauchy, mEulerCauchy] = reglin(x', eEulerCauchy');
[pPointMilieu, mPointMilieu] = reglin(x', ePointMilieu');
[pRungeKutta, mRungeKutta] = reglin(x', eRungeKutta');

// Affichage des ordres des schémas
disp(pEuler, 'Ordre de la méthode Euler :');
disp(pEulerCauchy, 'Ordre de la méthode Euler-Cauchy :');
disp(pPointMilieu, 'Ordre de la méthode du Point Milieu :');
disp(pRungeKutta, 'Ordre de la méthode Runge-Kutta :');
