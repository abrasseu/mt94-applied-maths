function [f] = fact(n)
    
    if (n - floor(n) ~= 0) | n < 0 then
        error("n doit être un entier naturel");
    end
    
    if n==0 then
        f = 1;
    else
        f = prod(1:n);
    end
    
endfunction
