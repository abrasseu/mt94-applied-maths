function [x,i] = PointFixe(f,g,x0,ITE_MAX,EPS)
	x(1) = x0;
	for i=2:ITE_MAX
		if (abs(f(x(i-1)))<EPS)	// Arret précision
			break;
		end

		// Code Méthode
		x(i) = g(x(i-1));
	end
endfunction