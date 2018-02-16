function floconVonKoch(origin,n,k,theta)
	if k<n
        
        r = 1/3;
        A = []


        xrpoly(origin,3,r,theta);
        theta = theta + %pi/3;
        a = origin + 
	end
endfunction

n = 5;
a = [0; 0];
b = [1; 0];
theta = %pi/3;

scf(0); clf;
courbeVonKoch(a,b,n);
