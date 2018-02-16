function [x,i] = Secante(f,a,b,ITE_MAX,EPS)
	x(1) = a; x(2) = b;
	for i=3:ITE_MAX
		if (abs(f(x(i-1)))<EPS)	// Arret précision
			break;
		end

		// Code Méthode
		x(i) = x(i-1) - f(x(i-1))/(f(x(i-1)) - f(x(i-2)))*(x(i-1) - x(i-2)) ;
	end
endfunction