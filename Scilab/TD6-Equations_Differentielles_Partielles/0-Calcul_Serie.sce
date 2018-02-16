function S = serie(a0, a, b, x, T, nbIte)
	S = zeros(1,length(x)) + a0/2;
	
	w = 2*%pi/T;
	for n=1:nbIte
		if (a == 0) then
			an = 0;
		else
			an = a(x,n,T);
		end
		if (b == 0) then
			bn =  0;
		else
			bn = b(x,n,T)
		end

		S = S + an*cos(n*w*x) + bn*sin(n*w*x);
	end
endfunction
