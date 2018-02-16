exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD4-Valeurs_Propres\2-Methode_Puissance.sce");

A = [	0.5172,	0.5473,	-1.224,		 0.8012;
		0.5473,	1.388,	1.353,		 -1.112;
		-1.224,	1.353,	0.03642,	 2.893;
		0.8012,	-1.112,	2.893,		 0.05827 ]

vps = spec(A);
disp(vps, 'Valeurs propres de A');

x0 = [1; 0; 0; 0];

[lambda, vp, nbIte] = methodePuissance(A, x0, 10^-2, 1000);

disp(lambda, 'Valeur propre dominante de A');
disp(vp, 'Vecteur propre de A associé à la valeur propre dominante');
disp(nbIte, 'Nombre ditération');
