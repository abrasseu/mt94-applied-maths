function tapis(S, n)
	// Décalage
	H = [0, 0, 0, 0; 1/3, 1/3, 1/3, 1/3];
	D = [1/3, 1/3, 1/3, 1/3; 0, 0, 0, 0]

	if n<1 then
		break;
	else

	S = S/3;
	S1 = S;
	S2 = S + H;
	S3 = S + 2*H;
	S4 = S + 2*H + D;
	S5 = S + 2*H + 2*D;
	S6 = S + H + 2*D;
	S7 = S + 2*D;
	S8 = S + D;
    disp(S5, n);
	
    SC = S8 + H;
    
    xfpoly(SC(1,:), SC(2,:), 1);
    e=gce();
    e.background = 8;

    //xpoly(SC(1,:), SC(2,:), 'lines', 1);

    xpoly(S5(1,:), S5(2,:), 'lines', 1);

    // xfpoly(S5(1,:), S5(2,:), 1);
    // e=gce();
    // e.background = 7;

    tapis(S1, n-1);
    tapis(S2, n-1);
    tapis(S3, n-1);
    tapis(S4, n-1);
    tapis(S5, n-1);
    tapis(S6, n-1);
    tapis(S7, n-1);
    tapis(S8, n-1);

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

    xfpoly(M0(1,:), M0(2,:), 1);
    e=gce();
    e.background=2;
    
    tapis(M, 3);
    
    xpoly(M0(1,:), M0(2,:), 'lines', 1);

