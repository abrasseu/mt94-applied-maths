function courbeVonKoch(a,b,theta,n)
	if n>0
		R = [cos(theta), sin(theta); -sin(theta), cos(theta)]

		ac = (b-a)/(1+cos(theta));
		c = ac;
		d = R*ac;
		e = b - ac;

        // c = a + (b-a)/3;
        // e = b - (b-a)/3;
        // d = c +rotation(%pi/3)*(e-c);

		// b = (a + b)/3;
		courbeVonKoch(a,c,theta,n-1);
		courbeVonKoch(c,d,theta,n-1);
		courbeVonKoch(d,e,theta,n-1);
		courbeVonKoch(e,b,theta,n-1);
	else
		// plot(a,b) 
        plot([a(1),b(1)],[a(2),b(2)]);
	end
endfunction

n = 2;
a = [0; 0];
b = [1; 0];
theta = %pi/3;

scf(0); clf;
courbeVonKoch(a,b,n);
