function tapis(a,b,c,d,n)
D = [0, 0, 0, 0; 1/3, 1/3, 1/3, 1/3];
H = [1/3, 1/3, 1/3, 1/3; 0, 0, 0, 0]
M = [a b c d]
	if n<1 then
		plot([a(1), b(1)],[a(2), b(2)]);
		plot([b(1), c(1)],[b(2), c(2)]);
		plot([c(1), d(1)],[c(2), d(2)]);
		plot([d(1), a(1)],[d(2), a(2)]);
		break;
	else


	S1 = M/3;
	S2 = M/3 + [0; 1/3]
	S3 = S2 +[0, 0, 0, 0; 1/3, 1/3, 1/3, 1/3]



		a1 = (a+b)/3;
		a2 = (a+b)/3 + [0, 1/3];

		b1 = (b+c)/3;
		b2 = (b+c)/3 + [1/3, 0];
		c1 = (c+d)/3 + [0, 1/3];        
		c2 = (c+d)/3;
		d1 = (a+d)/3 + [1/3, 0];
		d2 = (a+d)/3 + [0, 1/3];        

		e=[a(1); (d(2)-a(2))*2/3+a(2)]

	end

endfunction

function carr(M)
    //xfpoly(M(1,:), M(2,:), 1);
    xpoly(M(1,:), M(2,:), 'lines', 1);
    //e=gce();
    //e.background=2;
    xpoly(M0(1,:), M0(2,:), 'lines' ,1);
endfunction

clf;
set(gca(), 'isoview', 'on');    

A=[0; 0];
B=[0; 1];
C=[1; 1];
D=[1; 0];

M0 = [A B C D]
global M0;

M = [A B C D];
tapis(A,D,C,D,1)
