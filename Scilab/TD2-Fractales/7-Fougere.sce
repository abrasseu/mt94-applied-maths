function Y = T1(X)	// Tige
    Y = [0, 0; 0, 0.16]*X;
endfunction
function Y = T2(X)	// Sous-feuilles
    Y = [0.85, 0.04; -0.04, 0.85]*X + [0; 1.6];
endfunction
function Y = T3(X)	// Feuilles de gauche
    Y = [0.2, -0.26; 0.23, 0.22]*X + [0; 1.6];
endfunction
function Y = T4(X)	// Feuilles de droite
    Y = [-0.15, 0.28; 0.26, 0.24]*X + [0; 0.44];
endfunction

// Probabilité de choix des fonctions
p = [0.01, 0.85, 0.07, 0.07];

n = 100000;
W = zeros(2, n);

for i = 1:n-1
	t = rand();
	if (t < p(1))				
		W(:,i+1) = T1( W(:,i) );
	elseif (t < p(1)+p(2))
		W(:,i+1) = T2( W(:,i) );
	elseif (t < p(1)+p(2)+p(3))
		W(:,i+1) = T3( W(:,i) );
	else
		W(:,i+1) = T4( W(:,i) );
	end
end

clf;
set(gca(),"isoview","on");
plot(W(1,:),W(2,:),"g.",'markersize',1);
