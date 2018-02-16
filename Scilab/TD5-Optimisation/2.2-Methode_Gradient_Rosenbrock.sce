clear; scf(0); clf;
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD5-Optimisation\2-Methode_Gradient.sce");
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD5-Optimisation\rosen.sce");
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD5-Optimisation\pasOptimal.sci");

function y = fRsbrck(x)
	y = (1-x(1))^2 + 100*(x(2)-x(1)^2)^2;
endfunction
function grad = gradRsbrck(x)
	a = -2*(1-x(1)) -400*x(1)*(x(2) - (x(1))^2);
	b = 200*(x(2) - (x(1))^2);
	grad = [a; b];
endfunction
function p = pasOpti(x,grad)	// Pas Optimal pour fonction quelconque
	p = pasOptimal(x, -grad, list(fRsbrck));
endfunction

x0 = [-0.5; 0.5];
[soluce, ite] = methodeGradient(x0, fRsbrck, gradRsbrck, pasOpti, 10^-8, 1000, 0);
ecart = norm(soluce-[1;1]);
printf("Après %d itérations on obtient un écart de %f", ite, ecart);
