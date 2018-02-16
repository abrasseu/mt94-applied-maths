function [x, i] = methodeLM(x, gradf, Jf, lambda, ITE_MAX, EPS)
	J = Jf(x);
	grad = gradf(x)

	[a,b] = size(J);
	gradIni = norm(grad);

	for i = 1:ITE_MAX
		if norm(grad) < gradIni*EPS then
			break;
		end

		oldx = x;
		x = x - (J'*J + lambda*eye(a,a)) \ (J'*grad);

		plot([oldx(1) x(1)], [oldx(2), x(2)], 'r', 'linewidth',2);
		J = Jf(x);
		grad = gradf(x);
	end
endfunction
