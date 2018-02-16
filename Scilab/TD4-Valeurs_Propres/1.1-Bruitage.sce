n=256

//u = signal d'origine, (256,1)
//v = signal bruité via T par moyenne pondéré des voisins (256,1)
//v = Tu
//T = matrice de bruitage (256,256)
//eta bruit blanc

// Signal d'origine u
u = zeros(n,1)
u(50) = 1/4;
u(51) = 1/2;
u(52) = 1/4;
u(150) = 1;

// Matrice de bruitage T
T = zeros(n,n);
for i=1:n
	for j=1:n
		T(i,j) = exp(-1/10*(i-j)^2);
	end
	C(i) = sum(T(i,:));		// Correction pour que la somme de la ligne = 1
	T(i,:) = T(i,:)/C(i);
end

// Signal bruité de u par T
v = T*u;

// Signal bruité de v avec eta par 1%
eta = rand(n,1)
eta = eta/norm(eta)
eta = eta*norm(u)*0.01
w = v + eta;


clf
t = 1:n;
plot(t',[u,v,w]);
legend("u","v","w")
