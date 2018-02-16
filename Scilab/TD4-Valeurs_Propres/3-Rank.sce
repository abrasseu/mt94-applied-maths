exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD4-Valeurs_Propres\2-Methode_Puissance.sce");
function [G, R] = Rank(fileName)
	alpha = 0.85;				// Proportion magique pour cette recette

	// Lecture la matrice d'adjacence
	A = fscanfMat(fileName);

	[n p] = size(A);
	if (n <> p) then
		disp("La matrice nest pas carrée");
		abort;
	end
		
	// Construction de la matrice Google
	for j=1:n
		s = sum(A(:,j));			// Somme de la colonne
		if (s == 0) then
			G(:,j) = 1/n;
		else
			G(:,j) = alpha*A(:,j)./s + (1-alpha)/n;
		end
	end
	
	x0 = ones(n,1)./n;		// Equiprobabilité de départ
	[lambda, R, k] = methodePuissance(G, x0, 10^-10, 100);

	R = R/sum(R);
endfunction
