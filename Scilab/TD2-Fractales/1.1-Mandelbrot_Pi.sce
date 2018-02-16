clear;
ITE_MAX = 10^10;
NB_I = 5;

Z = ones(1,NB_I)./4;
Cv = []
for i=1:NB_I
    Z(i) = Z(i) + 10^(-2*i);
    Cv = [Cv %T];
end
C = Z;

Borne = max(abs(C),2);
N = zeros(1, NB_I);

for k=1:ITE_MAX
    if or(Cv) == %F then    // Toutes les valeurs ont divergé
        break
    end;
	Z(Cv) = Z(Cv).^2 + C(Cv);
    Cv = abs(Z)<Borne;
    N(Cv) = N(Cv) + 1;
end

for i=1:NB_I    // Affichage
    printf("\nPour i = %d, z = %1.16f, N(z) = %d",i,C(i),N(i));
end
