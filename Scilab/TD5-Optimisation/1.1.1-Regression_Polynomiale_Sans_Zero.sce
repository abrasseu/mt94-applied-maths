//Version sans i = 0
//load data1.dat;
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD5-Optimisation\1.1.0-Data.sce");
// data => [t y]

DEG_POLY_MAX = 10;

A = ones(length(t),1);
polys = zeros(DEG_POLY_MAX, DEG_POLY_MAX);

erreur = zeros(DEG_POLY_MAX, 1);

clf;
plot(t,y,"o");								// Affichage des données

// Calcul des polynomes
for i=1:DEG_POLY_MAX
	A = [A t.^i];							// Concaténation avec degré supérieur
	theta = A\y;							// Résolution des coefficient du polynome
	yPol = A*theta;

	polys(i, 1:length(theta)) = theta';		// Stockage des coefficients
	plot(t, yPol);							// Affichage des polynomes
	// legend

	erreur(i) = sum(yPol.^2-y.^2);

end

//	plot(t,y,"o", t,A*poly(i,:),"r");		// Affichage
