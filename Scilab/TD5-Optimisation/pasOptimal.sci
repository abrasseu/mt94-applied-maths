function rho=pasOptimal(x_k,d_k,f)

    // Recherche du pas optimal pour la méthode de descente
    // x_k+1=x_k+rho*d_k
    // f est la fonction à minimiser

    if type(f)<>15 // f peut être du type list(fun,p1,...,pn)
        f=list(f)
    end
    function y=phi(t)
        y=f(1)(x_k+t*d_k,f(2:$));
    endfunction

    // Recherche de l'intervalle initial

    a=0;b=0.5;c=1;
    phi0=phi(a);
    while phi(c)<phi0
        b=c; c=c*2;        
    end
        
    // Méthode de la section dorée (version non récursive) 
    // voir : http://en.wikipedia.org/wiki/Golden_section_search

    gn=(1+sqrt(5))/2; resgn=2-gn;
  
    for i=1:100 // 100 itérations maximum
        if c-b>b-a
            x=b+resgn*(c-b);
        else
            x=b-resgn*(b-a);
        end
        if abs(c-a)<1e-10*(abs(b)+abs(x))
            rho=(c+a)/2; 
            return
        end
        if phi(x)<phi(b)
            if c-b>b-a
                a=b;b=x;
            else 
                c=b;b=x;
            end
        else
            if c-b>b-a
                c=x;
            else 
                a=x;
            end
        end
    end

endfunction
