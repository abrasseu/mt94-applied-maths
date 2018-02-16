LAMBDA = %pi/8;
NB_TEMPS = 1000;	// Discrétisation du temps
NB_POINT = 100;		// Discrétisation de la fonction
t = linspace(0.01, 10, NB_TEMPS);       // t >0 pour éviter 
x = linspace(0, 2*%pi, NB_POINT);

for i =1:NB_TEMPS
	s = zeros(x);
	a0 = 2*LAMBDA/%pi;
	s = s + a0/2;

	for n = 1:NB_POINT
		an = 2/(n*%pi) * sin(n*(%pi - LAMBDA)) * exp(-n^2 * t(i));
	    s = s - an* cos(n*x);
	end

	drawlater;
	clf;
	plot(x,s);
	set(gca(), 'data_bounds', [0 2*%pi -0.2 1.2]);
	drawnow
end
