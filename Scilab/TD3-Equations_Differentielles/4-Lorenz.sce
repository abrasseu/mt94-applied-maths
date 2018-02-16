clear;
function dudt = fLorenz(t,u)
    sigma = 10;
    rho = 28;
    bet = 8/3;
    x = u(1);
    y = u(2);
    z = u(3);

    dudt = [
        sigma*(y-x);
        rho*x - y - x*z;
        x*y - bet*z;
    ];
endfunction

exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD3-Equations_Differentielles\0-Tous_Schemas.sce");
NB_POINTS = 50000;
t = linspace(0,500,NB_POINTS);
u0 = [10; 10; 10];
u = RungeKutta(u0, t, fLorenz);
clf;
param3d(u(1,:),u(2,:),u(3,:));
set(gca(), "isoview","on");
