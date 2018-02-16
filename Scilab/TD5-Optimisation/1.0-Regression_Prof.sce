// Calcul des coefficients
function [theta, yReg, err] = regression(t, y, p)
	n = length(t);
	A = ones(n, p+1);
	for i=1:p
		A(:, i+1) = t.^i;
	end
	theta = A\y;
	yReg = A*theta;
	err = norm(yReg - y)^2
endfunction

// Vérification
function y = evaPoly(theta, t)
	y = zeros(t) + theta(1);
	for i=2:length(theta)
		y = y + theta(i)*t.^(i-1);
	end
endfunction

exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD5-Optimisation\1.1.0-Data.sce");

// clf;
// [theta, yReg, err] = regression(t,y,3);
// plot(t,y,"o" , t, yreg)

n = length(t);
clf;

V = find(abs(t) <=1);
T = setdiff(1:n, V);


// [theta, yReg, err] = regression(t(T), y(T), 6);
// plot(t(T), y(T),"o" , t, yreg);



// plot(t(T), y(T), t(T), evaPoly(theta, t(T)))

// yv = evaPoly(theta, t(V))
// plot(t(V), y(V), t(V), yv)


for p=1:7
	[theta, yReg, e] = regression(t(T), y(T), p);
    err(p) = e/length(T);
	yv = evaPoly(theta, t(V));
	errv(p) = norm(y(V) - yv)^2/length(V);
end

plot((1:p)', err, "og-" , (1:p)', errv, "ob-")
