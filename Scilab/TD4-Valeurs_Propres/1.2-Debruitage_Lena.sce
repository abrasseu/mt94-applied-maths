clear;
lena = read("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD4-Valeurs_Propres\lena.csv",512,512)';
n = 512;
x = 1:n;		// Map de pixels pour l'affichage
y = n:-1:1;		// inverser car grayplot inverse

[U,S,V] = svd(lena);
sig = diag(S);

eps = 0.002;
for k=1:n-1
	if sig(k+1) < eps*sig(1) then
		break;
	end
end

// Matrice de floutage T
T = zeros(n,n);
for i=1:n
	for j=1:n
		T(i,j) = exp(-1/10 * (i-j)^2);
	end
	C(i) = sum(T(i,:));		// Correction pour somme de la ligne = 1
	T(i,:) = T(i,:)/C(i);
end

// Bruit blanc
eta = rand(n,n);
eta = eta/norm(eta);
eta = eta*norm(lena)*0.001;

v = T*lena*T;	// Floutage
w = v+eta;		// Bruitage
Ab = w;			// Image bruitée

// SVD de T
[UT, ST, VT] = svd(T)
sigT = diag(ST)

Tk = zeros(T');
for i=1:k
	Tk = Tk + sigT(i)*UT(:,i)*VT(:,i)'
end
Ar = pinv(Tk)*w*pinv(Tk);

// Écart
db = norm(lena-Ab, 'fro');
dr = norm(lena-Ar, 'fro');

clf; xset('colormap', graycolormap(256));
subplot(1,3,1); isoview(0,n,0,n);
grayplot(x,y,lena);
title(sprintf('$\\huge\\text{Image originale}$'));

subplot(1,3,2); isoview(0,n,0,n);
grayplot(x,y,Ab);
title(sprintf('$\\huge\\text{Image bruitée : écart }= %f$', db));

subplot(1,3,3); isoview(0,n,0,n);
grayplot(x,y,Ar);
title(sprintf('$\\huge\\text{Image débruitée : écart }= %f$', dr));

