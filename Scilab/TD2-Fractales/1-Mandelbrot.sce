clear;
ITE_MAX = 400;

// Grille des points
x = linspace(-2, 1, 800);
y = linspace(-1.5, 1.5, 600);
[X, Y] = ndgrid(x,y);

Z = X + %i*Y;
C = Z;						// Z0 = C = chaque point
Borne = max(abs(C),2);

for i=1:ITE_MAX
	Z = Z.^2 + C;
end

// Sélection des points
InMandelbrot = zeros(length(x), length(y));
Cv = abs(Z)<Borne;
InMandelbrot(Cv) = 1;

clf;
set(gca(), "isoview", "on");
set(gcf(), "color_map", graycolormap(ITE_MAX));
grayplot(x,y,InMandelbrot);
