function Y=f(X, d)
	Y = [
		norm(X-S1)^2 - d(1)^2;
		norm(X-S2)^2 - d(2)^2;
		norm(X-S3)^2 - d(3)^2;
	];
endfunction

// Jacobienne calculée à la main
function Y=Jf(X)
	Y = 2*[
		(X-S1)'
		(X-S2)'
		(X-S3)'
	];
endfunction

// ========== DONNEES ==========
	S1 = [-11716.227778, -10118.754628, 21741.083973]'; 
	S2 = [-12082.643974, -20428.242179, 11741.374154]';
	S3 = [14373.286650,  -10448.439349, 19596.404858]';
	d  = [22163.847742,  21492.777482,	21492.469326]; 
	R = 6371;			// Rayon Terre
	X0 = zeros(3,1);		// X0

// ========== VERIFICATION JACOBIENNE ==========
	Jth = Jf(X0);
	Jex = numderivative(f, X0);
	ecartJ = abs(Jth-Jex)./(Jth); // Ecart relatif th / exp

	disp("== Vérification de la Jacobienne calculée ==");
	disp(Jth, "Jacobienne théorique");
	disp(Jex, "Jacobienne approchée");
	disp(ecartJ, "Ecart entre les deux:");

// ==========       FSOLVE      ==========
	Xfsolve = fsolve(X0, f, Jf);

// ========== MÉTHODE DE NEWTON ==========

	// Constantes de vérification d'arrêt
	ITE_MAX=1000;
	EPS=1e-10;

	exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD1-Pb_Non_Lineaires\1.5-NewtonRn.sce");
	[Xnewton, ite] = NewtonRn(f,Jf,X0,ITE_MAX,EPS);
	Xnewton = Xnewton(:,$);
	
// ========== ECART ET AFFICHAGE ==========
	
	disp("== Comparaison des résultats ==");
	disp(Xnewton, "Résulat NEWTON");    // résultat
	
	disp(Xfsolve, "Résulat FSOLVE");
	ecartX = abs(Xnewton-Xfsolve)./(Xfsolve); // Ecart relatif th / exp
	disp(ecartX, "Ecart relatif");

	// altitude = norm(Xnewton) - R;
	// disp(altitude, "Altitude par rapport à la surface de la Terre");


