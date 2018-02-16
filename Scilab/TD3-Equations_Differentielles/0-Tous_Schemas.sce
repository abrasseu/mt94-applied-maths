// Paramètres des schémas : 
//		y0 vecteur colonne ou réel correspondant à la situation initiale
//		t vecteur ligne de discretisation de l'intervalle [t0 à t0+T]
//		y = f(t,x) l'équation à résoudre soit forme de vecteur colonne ou réel
//		
// Retourne
//		y matrice où chaque colonne correspond à une itération correspondant à la fonction y approchée 

// Schéma de Euler
function y = Euler(y0, t, f)
	n = length(t);
	h = t(2)-t(1);
	y(:,1) = y0;
	for i=1:n-1
		y(:,i+1) = y(:,i) + h.*f(t(i), y(:,i));
	end
endfunction

// Schéma de Euler-Cauchy
function y = EulerCauchy(y0, t, f)
	n = length(t);
	h = t(2)-t(1);
	y(:,1) = y0;

	for i=1:n-1
		k1 = f(t(i), 	 y(:,i));
		k2 = f(t(i) + h, y(:,i) + h*k1);
		y(:,i+1) = y(:,i) + h*(k1 + k2)/2;
	end
endfunction

// Schéma du Point Milieu
function y = PointMilieu(y0, t, f)
	n = length(t);
	h = t(2)-t(1);
	y(:,1) = y0;

	for i=1:n-1
		k1 = f(t(i),	 y(:,i));
		k2 = f(t(i)+h/2, y(:,i) + (h*k1)/2);
		y(:,i+1) = y(:,i) + h*k2;
	end
endfunction

// Schéma de Runge-Kutta
function y = RungeKutta(y0, t, f)
	n = length(t);
	h = t(2)-t(1);
	y(:,1) = y0;

	for i=1:n-1
		k1 = f( t(i),     y(:,i));
		k2 = f( t(i)+h/2, y(:,i) + (h*k1)/2);
		k3 = f( t(i)+h/2, y(:,i) + (h*k2)/2);
		k4 = f( t(i)+h,   y(:,i) + h*k3);
		y(:,i+1) = y(:,i) + h*(k1 + 2*k2 + 2*k3 + k4)/6;
	end
endfunction
