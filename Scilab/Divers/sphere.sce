clf;
set(gca(), "cube_scaling", "off");
set(gca(), "isoview", "on");

a = linspace(-%pi/2, %pi/2, 20);    // Phi
b = linspace(0, 2*%pi, 40);         // Theta

// Meshgrid phi, theta
[A B] = meshgrid(a, b);

// Fonctions x, y, z de (phi, theta)
X = cos(A).*cos(B);
Y = cos(A).*sin(B);
Z = sin(A);

surf(X,Y,Z);
