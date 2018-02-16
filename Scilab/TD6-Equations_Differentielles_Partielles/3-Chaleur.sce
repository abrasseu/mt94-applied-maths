NB_POINTS = 50;		// Discrétisation de la fonction
NB_TEMPS = 100;		// Discrétisation du temps
NB_COLOR = 128;
MAX_TEMPS = 6;
x = linspace(0, 2*%pi, NB_POINTS);
t = linspace(0.01, MAX_TEMPS, NB_TEMPS);       // t >0 pour éviter 
LAMBDA = %pi/2;
a0 = 2*LAMBDA/%pi;

// Calcul de la série de Fourier s
scf(0); clf;
s = zeros(NB_TEMPS, NB_POINTS);			//	Ligne par ligne on a un instant t, col par col un point => s(t,x)
for i =1:NB_TEMPS
	s(i,:) = a0/2;
	for n = 1:NB_POINTS
		an = 2/(n*%pi) * sin(n*(%pi - LAMBDA));
    	// an = rand();		// TEST random pour vérifier la convergence
		s(i,:) = s(i,:) - an* cos(n*x)* exp(-n^2 * t(i));
	end

	// Animation vague
	T = t(i)*ones(1,NB_POINTS);
	sleep(20)
	param3d(x,T,s(i,:));
	set(gca(), 'auto_scale', 'off', 'data_bounds', [0,2*%pi, 0,MAX_TEMPS, 0,1]);
end
xtitle('', 'x', 't', 'u(x,t)');

// Affichage de l'évolution de la solution
scf(1); clf;
surf(x,t,s);
set(gca(), 'auto_scale', 'off', 'data_bounds', [0,2*%pi, 0,MAX_TEMPS, 0,1]);
set(gcf(), 'color_map', hotcolormap(128));
set(gce(), 'color_flag',3, 'color_mode', -1);
xtitle('', 'x', 't', 'u(x,t)');

// Animation de la diffusion de la chaleur dans un anneau
r = [1 1.5]; // r1 r2
[R, THETA] = meshgrid(r, x);
X = R.*cos(THETA);
Y = R.*sin(THETA);

scf(2); clf;
for k=1:NB_TEMPS
	Z = [s(k,:)' s(k,:)']
    sleep(20)
	drawlater;
	clf;
	Color = floor((1-0)*(NB_COLOR-1)*Z)+1;
    // Transformation linéaire de Z avec la plage et la taille de la colormap, chaque valeur de C associée à une valeur de Z correspond à l'indice de la colormap
	surf(X,Y,Z,Color);
	set(gca(), 'view', '2d', 'isoview', 'on', 'auto_scale', 'off', 'data_bounds', [-1.5,1.5,-1.5,1.5,0,1]);
	set(gcf(), 'color_map', hotcolormap(NB_COLOR));
	set(gce(), 'color_flag', 3, 'color_mode', -1, 'cdata_mapping', 'direct');
	drawnow;
end
colorbar(0, 1);
