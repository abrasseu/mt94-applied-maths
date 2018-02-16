clear;
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD5-Optimisation\1.0-Data.sce");

DEG_POLY_MAX = 10;
NB_SETS = 3;
myColor = rainbowcolormap(DEG_POLY_MAX+1);

// Degré k => k+1 coeff
polys = zeros(DEG_POLY_MAX+1, DEG_POLY_MAX+1);
erreur = zeros(NB_SETS, DEG_POLY_MAX+1);
errMoy = zeros(DEG_POLY_MAX+1);

// Verification Sets
Va = find(abs(t) <=1);
Vb = find(abs(t) <=0.5);
Vc = 1:2:length(t);
Vall(1, 1:length(Va)) = Va;
Vall(2, 1:length(Vb)) = Vb;
Vall(3, 1:length(Vc)) = Vc;

tailleSet = [length(Va), length(Vb), length(Vc)];
clear Va Vb Vc;

for s=1:NB_SETS
	V = Vall(s, 1:tailleSet(s));	// Validation Set
	T = setdiff(1:length(t), V);	// Training Set

	// Calcul des polynomes
	A = [];
	for p=0:DEG_POLY_MAX
		A = [A t.^p];				// Concaténation avec degré supérieur
		theta = A(T,:)\y(T);		// Résolution des coefficient du polynome avec les données de Training
		yPoly = A*theta;			// y du polynome

		polys(p+1, 1:length(theta)) = polys(p+1, 1:length(theta)) + theta';	// Stockage des coefficients pour moyenne après
		// Ligne p = ploy de degré p, col = coeff

		erreur(s, p+1) = sum((yPoly(V)-y(V)).^2);  // Erreur de validation pour set s et poly p
	end
end
polys = polys./NB_SETS;					// Moyenne de la somme déjà calculée

clf; subplot(1,2,1);
plot(t,y, "ok");
title("$\huge\text{Polynomes moyens sur les différents sets}$");
leg = legend("Données");
A =[];
for p=0:DEG_POLY_MAX		// Affichage des résultats des sets
	errMoy(p+1) = mean(erreur(:,p+1));	// Erreur moyenne du polynome sur tous sets 
	A = [A t.^p];
	yPoly = A*polys(p+1,1:p+1)';
	plot(t, yPoly, 'Foreground', myColor(p+1,:));
    leg = legend(leg.text, sprintf("Degré %i", p));
end

// Affichage des erreurs
subplot(1,2,2);
bar(0:DEG_POLY_MAX, errMoy);
title("$\huge\text{Erreur moyenne par polynome}$");

// Affichage du meilleur polynome
[m, k] = min(errMoy);					// k est la ligne du polynome donc deg = k-1
mprintf("\n Après validation croisée avec %i sets différents,\n le polynome optimal est de degré %i :\n", NB_SETS, k-1);
mprintf("\n   %.3f", polys(k,1));
for i=2:k
    mprintf(" + %.3f*x^%d", polys(k,i), i-1);
end
mprintf("\n");
