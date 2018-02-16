clear;
// Chargement de la matrice à partir du csv de l'image
lena = read("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD4-Valeurs_Propres\lena.csv",512,512)';
n=512;				// Résolution de l'image

// Map de pixels pour l'affichage
x = [1:512];
y = [512:-1:1];		// inverser car grayplot inverse

// Décomposition SVD
[U,S,V] = svd(lena);
sig = diag(S);

clf; subplot(2,3,4);
title('$\huge \text{Rapport } \frac{\sigma_i}{\sigma_1}$');
plot(sig/sig(1),'k');

// Récupération de la dernière valeur supérieure au seuil
eps = 0.005;
for k1=1:n-1
	if sig(k1+1)<eps*sig(1) then
		break;
	end:
end
k2 = 50;
plot(k1, sig(k1)/sig(1), 'rx', 'MarkerSize', 10);
plot(k2, sig(k2)/sig(1), 'b+', 'MarkerSize', 10);

// Somme pour obtenir les Ak
Ak1 = sig(1)*U(:,1)*V(:,1)';
for i=2:k1
	Ak1 = Ak1 + sig(i)*U(:,i)*V(:,i)';
end
dk1 = norm(lena-Ak1, 'fro');  // Ecart

Ak2 = sig(1)*U(:,1)*V(:,1)';
for i=2:k2
	Ak2 = Ak2 + sig(i)*U(:,i)*V(:,i)';
end
dk2 = norm(lena-Ak2, 'fro');
	
// Affichage images et différence
set(gcf(), 'color_map', graycolormap(256));
subplot(2,3,1); isoview(0,n,0,n);
title('$\huge\text{Lena Originale}$');
grayplot(x,y, lena);

subplot(2,3,2); isoview(0,n,0,n);
title(sprintf('$\\huge\\text{Lena Compressée avec } k=%d$', k1));
grayplot(x,y, Ak1);
subplot(2,3,5); isoview(0,n,0,n);
title(sprintf('$\\huge\\text{Lena Compressée avec } k=%d$', k1));
title(sprintf('$\\huge\\text{Différence : } %f$', dk1));
grayplot(x,y, Ak1-lena);

subplot(2,3,3); isoview(0,n,0,n);
title(sprintf('$\\huge\\text{Lena Compressée avec } k=%d$', k2));
grayplot(x,y, Ak2);
subplot(2,3,6); isoview(0,n,0,n);
title(sprintf('$\\huge\\text{Différence : } %f$', dk2));
grayplot(x,y, Ak2-lena);

tailleK1 = k1*(n+n+1);
tailleK2 = k2*(n+n+1);
printf('\n%-31s = %d', 'Taille originale', n*n);
printf('\n%-32s = %d', 'Taille après compression k1='+string(k1), tailleK1);
printf('\n%31s = %2.2f%%', 'Taux de compression', 100-tailleK1/(n*n)*100);
printf('\n%-32s = %d', 'Taille après compression k2='+string(k2), tailleK1);
printf('\n%31s = %2.2f%%', 'Taux de compression', 100-tailleK2/(n*n)*100);

