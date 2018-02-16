function dessine_bras(theta, cercle, myColor)
    // Longueur bras
    l1=1;
    l2=1;
    // Coordonnée point du bras
    x=[0
       l1*cos(theta(1))
       l1*cos(theta(1))+l2*cos(sum(theta))];
    y=[0
       l1*sin(theta(1))
       l1*sin(theta(1))+l2*sin(sum(theta))];
    
    if cercle==1 then
        t=linspace(0,2*%pi,64);
        plot(1+.5*cos(t),1+.5*sin(t),"r-",x,y,"-o");
    else
        plot(x,y, 'Foreground', myColor);
    end
    set(gca(),"isoview","on")
    drawnow;
endfunction

//dessine_bras([%pi/3 %pi/3])
