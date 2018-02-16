function plotCube(origin, r)
	ox = origin(1)
	oy = origin(2)
	oz = origin(3)

	// Côtés
	z = [oz, oz; oz+r, oz+r];
	x = [ox, ox]
	y = [oy, oy+r]
	plot3d(x,y,z)
	x = [ox+r, ox+r]
	y = [oy, oy+r]
	plot3d(x,y,z)

	z = [oz, oz+r; oz, oz+r];
	x = [ox, ox+r]
	y = [oy+r, oy+r]
	plot3d(x,y,z)
	x = [ox, ox+r]
	y = [oy, oy]
	plot3d(x,y,z)

	// Base et Plafond
	x = [ox, ox+r]
	y = [oy, oy+r]
	z = [oz, oz; oz oz];
	plot3d(x,y,z)
	z = [oz+r, oz+r; oz+r oz+r];
	plot3d(x,y,z)

endfunction

function Menger(origin, k,n)
	if k > 0 then	// On continue la récursivité avec les 8 sous-cubes

		// Vecteurs de décalage
		r = 1/(3^(n-k+1));
		right	= [r, 0, 0];
		back	= [0, r, 0];
		up		= [0, 0, r];

		// O(zyx)
		o111 = origin;
		o112 = origin + right;
		o113 = origin + 2*right;
		o121 = origin + back;
		// o122 = origin + back + right;
		o123 = origin + back + 2*right;
		o131 = origin + 2*back;
		o132 = origin + 2*back + right;
		o133 = origin + 2*back + 2*right;

		o211 = origin + up;
		// o212 = origin + up + right;
		o213 = origin + up + 2*right;
		// o221 = origin + up + back;
		// o222 = origin + up + back + right;
		// o223 = origin + up + back + 2*right;
		o231 = origin + up + 2*back;
		// o232 = origin + up + 2*back + right;
		o233 = origin + up + 2*back + 2*right;

		o311 = origin + 2*up;
		o312 = origin + 2*up + right;
		o313 = origin + 2*up + 2*right;
		o321 = origin + 2*up + back;
		// o322 = origin + 2*up + back + right;
		o323 = origin + 2*up + back + 2*right;
		o331 = origin + 2*up + 2*back;
		o332 = origin + 2*up + 2*back + right;
		o333 = origin + 2*up + 2*back + 2*right;

		clear origin r right up back;

		Menger(o111, k-1, n);
		Menger(o112, k-1, n);
		Menger(o113, k-1, n);
		Menger(o121, k-1, n);
		// Menger(o122, k-1, n);
		Menger(o123, k-1, n);
		Menger(o131, k-1, n);
		Menger(o132, k-1, n);
		Menger(o133, k-1, n);

		Menger(o211, k-1, n);
		// Menger(o212, k-1, n);
		Menger(o213, k-1, n);
		// Menger(o221, k-1, n);
		// Menger(o222, k-1, n);
		// Menger(o223, k-1, n);
		Menger(o231, k-1, n);
		// Menger(o232, k-1, n);
		Menger(o233, k-1, n);

		Menger(o311, k-1, n);
		Menger(o312, k-1, n);
		Menger(o313, k-1, n);
		Menger(o321, k-1, n);
		// Menger(o322, k-1, n);
		Menger(o323, k-1, n);
		Menger(o331, k-1, n);
		Menger(o332, k-1, n);
		Menger(o333, k-1, n);

	else			// k = 0 => On affiche le sous-cube
		r = 1/(3^n);
		plotCube(origin, r)

	end
endfunction

origin = [0, 0, 0];
n = 2;
clf;
set(gca(), 'isoview', 'on', 'auto_scale', 'off', 'data_bounds', [0,0,0; 1,1,1]);
Menger(origin, n, n);
