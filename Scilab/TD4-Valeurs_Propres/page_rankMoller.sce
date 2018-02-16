n = 6;
p = 0.85;
eps = 0.0001

s = sparse([2,1;3,2;4,2;4,3;5,3;6,3;1,4;6,5;1,6],[ones(9,1)]);
G = full(s);
c = sum(G,1)//calcule la somme des colonnes de G
c(c<>0) = 1../c(c<>0);
lambda = diag(c);
e = ones(n,1);
f = ones(n,1);
f(c =  = 0) = 0;
H = p*G*lambda+1/n*e*(e-p*f)';
x0 = ones(n,1)/n;
for i = 1:10
    x1 = H*x0
    if(norm(x1-x0)<eps) then
        break;
end
x0 = x1
end
disp(x1);
xgauss = (eye(n,n)-p*G*lambda)\((0.15/n)*e);
[a,b] = gsort(xgauss);
disp(b,"page par ordre d''importance:");
disp(a,"PageRank:");
