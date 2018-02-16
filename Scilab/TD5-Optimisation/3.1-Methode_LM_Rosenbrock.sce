clear; scf(0); clf;
function y = gradf(x)
	y = [1-x(1); 10*(x(2)-x(1)^2)];
endfunction
function J = Jf(x)
	J = [-1, 0; -20*x(1), 10];
endfunction

exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD5-Optimisation\3-Methode_LM.sce");
x0 = [0; 1];
lambda =[0, .25, .75, 1];
for i=1:4
	subplot(1,4,i);
	exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD5-Optimisation\rosen.sce");
	[soluce, ite] = methodeLM(x0, gradf, Jf, lambda(i), 100, 10^-8);
	title(sprintf("$\\huge\\lambda=%1.2f \\text{ et convergence en }%d \\text{ itérations}$", lambda(i),ite));
	printf("Avec lambda = %1.2f, la méthode converge après %d itérations.\n", lambda(i), ite);
end
