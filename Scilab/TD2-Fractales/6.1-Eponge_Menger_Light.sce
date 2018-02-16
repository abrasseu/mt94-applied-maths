clear;
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD2-Fractales\Plot_Cube.sce");

function Menger(origin, k,n)
	if k > 0 then	// On continue la récursivité avec les 8 sous-cubes

		// Vecteurs de décalage
		r = 1/(3^(n-k+1));
		right	= [r, 0, 0];
		back	= [0, r, 0];
		up		= [0, 0, r];
		clear r;

		Menger(origin, k-1, n);
		Menger(origin + right, k-1, n);
		Menger(origin + 2*right, k-1, n);
		Menger(origin + back, k-1, n);
		Menger(origin + back + 2*right, k-1, n);
		Menger(origin + 2*back, k-1, n);
		Menger(origin + 2*back + right, k-1, n);
		Menger(origin + 2*back + 2*right, k-1, n);

		Menger(origin + up, k-1, n);
		Menger(origin + up + 2*right, k-1, n);
		Menger(origin + up + 2*back, k-1, n);
		Menger(origin + up + 2*back + 2*right, k-1, n);

		Menger(origin + 2*up, k-1, n);
		Menger(origin + 2*up + right, k-1, n);
		Menger(origin + 2*up + 2*right, k-1, n);
		Menger(origin + 2*up + back, k-1, n);
		Menger(origin + 2*up + back + 2*right, k-1, n);
		Menger(origin + 2*up + 2*back, k-1, n);
		Menger(origin + 2*up + 2*back + right, k-1, n);
		Menger(origin + 2*up + 2*back + 2*right, k-1, n);

		clear origin right up back;
	else			// k = 0 => On affiche le sous-cube
		r = 1/(3^n);
		plotCube(origin, r)
	end
endfunction

origin = [0, 0, 0];
n = 3;
clf;
set(gca(), 'isoview', 'on', 'auto_scale', 'off', 'data_bounds', [0,0,0; 1,1,1]);
Menger(origin, n, n);
