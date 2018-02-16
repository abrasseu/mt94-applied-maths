function [lambda, y, k] = methodePuissance(A, x, TOL, ITE_MAX)
	y = x/norm(x);

	for k=1:ITE_MAX
		x = A*y;					// Puissance
		x = x/norm(x);				// Normalisation
		if norm(x-y) < TOL then 	// Arrêt si l'écart est inférieur au seuil de tolérance
			break;
		end 
		y = x;
	end 

	lambda = x'*A*x;				// Valeur propre dominante
endfunction
