clear; clf;
RES = 600; UPTO = 1;
ITEMAX = 300;

// Grille
x = linspace(-UPTO, UPTO, RES);
y = linspace(-UPTO, UPTO, RES);

// Choix du c
c(1) = 0.32    +0.043*%i;
c(2) = -0.338  -0.622*%i;
c(3) = -0.8    +0.156*%i;
c(4) = -0.755  -0.042*%i;
//c(4) = -0.1011 + 0.9563*%i;
//c(4) = -1.401155;
//c(4) = 0.3774  + 0.19*%i;
//c(4) = 0.3     - 0.49*%i;
//c(4) = -0.708  -0.23*%i;

for k=1:length(c)
	ck = c(k);
	[X, Y] = meshgrid(x,y);
	Z = X+ %i*Y;

	Color = zeros(length(x), length(y));
	Borne = max(abs(ck),2);

	for i=1:ITEMAX
		Z = Z.^2 + ck;
		Cv = abs(Z)<Borne;
		Color(Cv) = Color(Cv)+1;
	end

	subplot(1,4,k);
	set(gca(), "isoview", "on");
	set(gcf(), "color_map", oceancolormap(ITEMAX));
	grayplot(x,y,Color);
	title(sprintf("$$\\huge c = %f + %f i$$", real(ck), imag(ck)), 'position', [-0.7 1.1]);
end
