function Sierpinsky(a, b, c, n)
	if n>0 then
		// Calcul milieux segments
		D = (a+b)/2;
		E = (b+c)/2;
		F = (c+a)/2;
		K = [D E F];

		// Tracé et appels récursif
		xfpoly(K(1,:), K(2, :), 8);
		Sierpinsky(a,D,F,n-1);
		Sierpinsky(D,b,E,n-1);
		Sierpinsky(F,E,c,n-1);
	end

endfunction

a = [0; 0];
b = [0.5; sqrt(3)/2];
c = [1; 0];
T = [a b c];

clf;
xfpoly(T(1,:), T(2,:), 1);
set(gca(), 'isoview', 'on');

n = 9;
replot([0 0 1 1]);
Sierpinsky(a,b,c,n);
