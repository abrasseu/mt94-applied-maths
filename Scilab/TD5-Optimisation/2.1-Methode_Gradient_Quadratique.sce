clear; scf(0); clf;
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD5-Optimisation\2-Methode_Gradient.sce");
function y = fQuad(x)			// Forme quadratique à minimiser
	y = .5*x'*A*x-b'*x;
endfunction
function grad = gradQuad(x)		// Trouvé avec développement f(x+h)
	grad = A*x - b;
endfunction
function p = pasQuad(x, grad)	// Pas Optimal pour forme quadratique
	p = grad'*grad/(grad'*A*grad);
endfunction

// Inputs
x0 = [1; 0];
A = [2 -1; -1 2];
b = [1; 1];
global A, b;

clf;
[soluce, ite] = methodeGradient(x0, fQuad, gradQuad, pasQuad, 100, 10^-8, 1);
ecart = norm(soluce-[1; 1]);
printf("Après %d itérations on obtient un écart de %f", ite, ecart);
