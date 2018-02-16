function Y=f(X)
	Y = [
		norm(X-S1)^2 - d(1)^2;
		norm(X-S2)^2 - d(2)^2;
		norm(X-S3)^2 - d(3)^2;
	];
endfunction
function Y=Jf(X)		// Jacobienne calculée à la main
	Y = 2*[
		(X-S1)'
		(X-S2)'
		(X-S3)'
	];
endfunction

// Données
S1 = [-11716.227778; -10118.754628; 21741.083973]; 
S2 = [-12082.643974; -20428.242179; 11741.374154];
S3 = [14373.286650;  -10448.439349; 19596.404858];
d  = [22163.847742;  21492.777482;	21492.469326]; 
R = 6371;			// Rayon Terre
X0 = zeros(3,1);

// Verification Jacobienne pour X0
Jth = Jf(X0);
Jex = numderivative(f, X0);
ecartJ = abs(Jth-Jex);


// Résulats
Xfsolve = fsolve(X0, f, Jf);

exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD1-Pb_Non_Lineaires\1.5-NewtonRn.sce");
[Xnewton, ite] = NewtonRn(f,Jf,X0,1000,1e-10);
Xnewton = Xnewton(:,$);
ecartX = abs(Xnewton-Xfsolve);
altitude = norm(Xnewton) - R;

// Affichage
disp("== Vérification de la Jacobienne calculée ==");
disp(Jth, "Jacobienne théorique");
disp(Jex, "Jacobienne approchée");
disp(ecartJ, "Ecart entre les deux:");

disp("== Comparaison des résultats ==");
disp(Xnewton, "Résulat NEWTON");    // résultat
disp(Xfsolve, "Résulat FSOLVE");
disp(ecartX, "Ecart relatif");

disp(altitude, "Altitude par rapport à la surface de la Terre");


