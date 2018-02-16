function [quotient, reste] = divEucl(p,q)

	reste = p;
	quotient=0;
    while reste >= q
        reste = reste - q;
        quotient = quotient +1; 
        
    end
endfunction

[q,r] = divEucl(70,6);
disp(r,'Reste',q,'Quotient');
