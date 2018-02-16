// Coefficients an et bn avec en paramètres x, n, T
function y = a(x,n,T)
	// y = ....
endfunction
function y = b(x,n,T)
	// y = ....
endfunction

function S = serie(a0, a, b, x, T, nbIte)
	S = zeros(1,length(x)) + a0/2;
	
	w = 2*%pi/T;
	for n=1:nbIte
		if (a == 0) then
			an = 0;
		else
			an = a(x,n,T);
		end
		if (b == 0) then
			bn =  0;
		else
			bn = b(x,n,T)
		end

		S = S + an*cos(n*w*x) + bn*sin(n*w*x);
	end
endfunction

// Paramètres
NB_POINTS = 400;
NB_ITE = 500;
XMIN = 0;
XMAX = 1/2;
a0 = 1/3;
T = 1/2;

x = linspace(XMIN,XMAX, NB_POINTS);
S = serie(a0, a, b, x, T, NB_ITE);
clf; plot(x, S);
