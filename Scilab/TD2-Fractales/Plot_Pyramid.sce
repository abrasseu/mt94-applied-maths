function plot(origin, r)
	ox = origin(1)
	oy = origin(2)
	oz = origin(3)

	// Base
	x = [ox, ox+r]
	y = [oy, oy+r]
	z = [oz, oz; oz oz];
	plot3d(x,y,z)

// plot3d([0 .5 1],[0 .5 1], [0 0 0; 0 1 0; 0 0 0])
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

	
endfunction
// 

