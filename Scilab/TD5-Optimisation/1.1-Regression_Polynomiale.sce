//load data1.dat;
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD5-Optimisation\1.1.0-Data.sce");
// data => [t y]

DEG_POLY_MAX = 10;

// Degré k => k+1 coeff
A = [];
polys = zeros(DEG_POLY_MAX+1,DEG_POLY_MAX+1);
erreur = zeros(DEG_POLY_MAX+1, 2);


// V = find(abs(t) <=1);						// Verification Set
// V = find(abs(t) <=0.5);						// Verification Set
V = 1:2:length(t);							// Verification Set

T = setdiff(1:length(t), V);				// Training Set

clf;
plot(t(T), y(T), "ob" , t(V), y(V), "or");	// Affichage des données de Training en bleu et de Validation en rouge

// Calcul des polynomes
for i=0:DEG_POLY_MAX

	A = [A t.^i];							// Concaténation avec degré supérieur
	theta = A(T,:)\y(T);					// Résolution des coefficient du polynome avec les données de Training
	yPol = A*theta;							// y du polynome

	polys(i+1, 1:length(theta)) = theta';	// Stockage des coefficients
	plot(t, yPol);							// Affichage des polynomes
	// legend

	erreur(i+1, 1) = sum((yPol-y).^2);			// Erreur totale
	erreur(i+1, 2) = sum((yPol(V)-y(V)).^2);	// Erreur de validation
	// erreur(i+1, 3) = sum((yPol(T)-y(T)).^2);	// Erreur de training
	// erreur(i+1, 4) = mean(erreur(i+1, 1:2));	// Erreur moyenne Valid / Totale

end

figure(1);
clf;
bar(1:DEG_POLY_MAX+1, log(erreur(:,2)));
//bar(1:DEG_POLY_MAX+1, (erreur(:,2)./max(erreur(:,2))));


[m, k] = min(erreur(:, 2));						// k est la ligne du polynome donc deg = k-1
disp("après validation.", polys(k, 1:k), "de coefficient" , k-1, "Le polynome optimal est de degré");


