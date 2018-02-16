function [x,i] = Newton(f,df,x0,ITE_MAX,EPS)
	x(1) = x0;
	for i=2:ITE_MAX
		if (abs(f(x(i-1)))<EPS)	// Arret précision
			break;
		end

		// Code Méthode
		x(i) = x(i-1) - f(x(i-1))/df(x(i-1));
	end
endfunction