function Sierpinski2D(n, profondeur)

// Dessine la figure de base

// Calcule angle

angle = 0;
for k=0:floor(n/4)
	angle = angle + cos(2*k*%pi/n);
end
angle = 1/2*angle;


disp(angle)
endfunction








