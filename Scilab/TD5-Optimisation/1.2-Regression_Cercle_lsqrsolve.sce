clear;
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD5-Optimisation\1.0-Data.sce");
function v = r(x,m)       // r(theta)
    v = A*x - z
endfunction

n = 100		// Nombre de données
RAND_MIN = 0.95;
RAND_ECART = .1;

// Génération des données 'expérimentales'
t = linspace(0,2*%pi,n)
rayon = 1;
centre = [1.5; 1.5];
bruit = RAND_MIN + rand(1,n)*RAND_ECART;

xData = centre(1)+rayon*cos(t).*bruit;
yData = centre(1)+rayon*sin(t).*bruit;

// Construction des matrices
A = [2*xData', 2*yData', ones(n,1)];
z = [xData'.^2 + yData'.^2];

x0 = zeros(3,1);    // Estimation initiale [a0;b0;c0]

[theta, v] = lsqrsolve(x0,r,n);
a = theta(1);
b = theta(2);
R = sqrt(theta(3) + a^2 + b^2);

scf(0); clf;
plot(xData,yData,"ko");
set(gca(), 'isoview','on', 'data_bounds', [0 3 0 3]);
xSoluce = a + R*cos(t);
ySoluce = b + R*sin(t);
plot(xSoluce, ySoluce, 'r');

printf("\nOn obtient le cercle de centre (%.3f; %.3f) et de rayon %.3f", a,b,R);
ecart = sum(v.^2);
printf("\nL écart au sens des moindres carrés est : %f\n", ecart)
