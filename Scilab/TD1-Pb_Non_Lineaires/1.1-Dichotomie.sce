function [x,i] = Dichotomie(f,a,b,ITE_MAX,EPS)
	x(1) = a;
	for i=2:ITE_MAX
		if (abs(f(x(i-1)))<EPS)	// Arret précision
			break;
		end

		// Code Méthode
		x(i) = (a+b)/2;
		if (f(a)*f(x(i))>0)
			a = x(i);
		else
			b = x(i);
		end
	end
endfunction
