function cantor(n, C)
	if n >= m then
		break;
	else
		n=n+1;

		// Calcul des 2 segments
		C1 = C./3;
		C2 = C./3 +2/3;

		plot(C1, [n, n]);
		plot(C2, [n, n]);

        //disp(n);
		cantor(n, C1);
		cantor(n, C2);
		
		//disp(C1, 'C1');
		//disp(C2, 'C2');
		//C = [C1, C2];
		//disp(C, 'C');
		//disp(n, '================= N');
	end
endfunction

clf;
n =0;
m = 7;
global m;
C = [0, 1]; // Segment initial

plot(C, [-1,-1]);
plot(C, [0,0]);
cantor(n, C);

plot(C, [m+1,m+1]);
