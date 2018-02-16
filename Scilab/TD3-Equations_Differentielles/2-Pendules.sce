clear;
function dydt = f(t,y)
	g = 9.8;
	L = 10;

	theta = y(1);
	thetaprime = y(2);
	dydt = [ thetaprime ; -g/L * sin(theta) ];
endfunction
function dydt = approx(t,y)
	g = 9.8;
	L = 10;

	theta = y(1);
	thetaprime = y(2);
	dydt = [ thetaprime ; -g/L * theta ];
endfunction
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD3-Equations_Differentielles\0-Tous_Schemas.sce");

t0 = 0; T  = 40;
n = 40;						// Nombre de points
h = T/n;
t = linspace(t0,t0+T,n);
c = [0, 1];					// Centre et longueur
l = 1;

// Conditions initiales (i,j,k) : angle = i*PI/j, vitesse = k
thNum = [ 1, 64,0;
		  1, 16,0;
		  1, 4, 0;
		  2, 3, 0 ];
thetas = [ thNum(:,1)*%pi./thNum(:,2), thNum(:,3) ];

scf(0); clf;
scf(1); clf;
for k=1:length(thetas)/2

	y0 = thetas(k,:)';

	Original = RungeKutta(y0,t, f)';
	Approximation = RungeKutta(y0,t, approx)';

	scf(0);	subplot(2,2,k);
	xtitle("$\huge\text{Comparaison des méthodes pour } \theta_0 = \frac{" + string(thNum(k,1)) + "\pi}{" + string(thNum(k,2)) + "} \text{ et } v_0 =" + string(thNum(k,3)) + "$", "t", "$ \theta $");
	plot(t',[Original(:,1), Approximation(:,1)]);

	scf(1); subplot(2,2,k);
    set(gca(),'isoview','on', 'data_bounds', [-1.5, 1.5, -0.1, 1.5]);	
	plot(c(1), c(2), 'kx');
    z = [Original(1:20,1) Approximation(1:20,1)];
	x = c(1) + l*sin(z);
	y = c(2) - l*cos(z);
	plot(x,y,'.-');
	title("$\huge\text{Pendule pour } \theta_0 = \frac{" + string(thNum(k,1)) + "\pi}{" + string(thNum(k,2)) + "} \text{ et } v_0 = " + string(thNum(k,3)) + "$");
end

scf(0); legend("Problème original", "Approximation", 4);
scf(1); legend("Centre", "Problème original", "Approximation", 4);

// TODO Erreur cumulée
