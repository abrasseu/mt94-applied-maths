function dessine_bras(theta,l1,l2,xA,yA)
    x=[0 l1*cos(theta(1)) l1*cos(theta(1))+l2*cos(sum(theta))];
    y=[0 l1*sin(theta(1)) l1*sin(theta(1))+l2*sin(sum(theta))];
    drawlater
    clf
    plot(x,y,"-o",xA,yA);
    set(gca(),"isoview","on","data_bounds",[-1 2 0 2])
    drawnow
endfunction

function out=f(theta,l1,l2,xA,yA)
    M=[l1*cos(theta(1))+l2*cos(sum(theta))
       l1*sin(theta(1))+l2*sin(sum(theta))];
    out=M-[xA;yA];
endfunction

l1=1;l2=1
theta=[0;0]
N=100
t=linspace(0,2*%pi,N)
xA=1+.5*cos(t);
yA=1+.5*sin(t);
for i=1:N
    theta=fsolve(theta,list(f,l1,l2,xA(i),yA(i)))
    dessine_bras(theta,l1,l2,xA,yA)
    xs2gif(0,sprintf("img%03d.gif",i))
end
