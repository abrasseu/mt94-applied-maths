function Cantor(n, a, b)
	if n>0
		plot([a,b], [n,n]);
		c = a+(b-a)/3;
		d = b-(b-a)/3;
		Cantor(n-1, a, c);
		Cantor(n-1, d, b);
	end
endfunction

n = 7;
a = 0; b = 1;

clf;
Cantor(n, a,b);
replot([0 0 1 n+1]);
