function TapisSierpinsky(origin, k, n)
if k>0 then
	r = 1/(3^(n-k+1));
	D = [r; 0];
	H = [0; r];

	// Calcul des points inférieurs gauche de chaque carré
	a = origin;
	b = origin + D;
	c = origin + 2*D;
	d = origin + 2*D + H;
	e = origin + 2*D + 2*H;
	f = origin + D + 2*H;
	g = origin + 2*H;
	h = origin + H;
	i = origin + D + H;

	// Enlève le carré centrale
	centre = [i d e f];
	xfpoly(centre(1,:), centre(2,:), 8);

	clear origin r D H centre i;

	TapisSierpinsky(a, k-1, n);
	TapisSierpinsky(b, k-1, n);
	TapisSierpinsky(c, k-1, n);
	TapisSierpinsky(d, k-1, n);
	TapisSierpinsky(e, k-1, n);
	TapisSierpinsky(f, k-1, n);
	TapisSierpinsky(g, k-1, n);
	TapisSierpinsky(h, k-1, n);
end
endfunction

clf;
set(gca(), 'isoview', 'on');    

n = 5;
origin = [0; 0];
xfpoly([0 1 1 0], [0 0 1 1], 1);
replot([0 0 1 1]);
TapisSierpinsky(origin, n, n);
