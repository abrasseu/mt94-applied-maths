// Algorithme PageRank pour MT00
// S. Mottelet, UTC/UTSEUS
// Jeu 12 mai 2016 10:39:13 CEST

clear;
function search(U,x,term) // fonction de recherche par mot-clés contenus dans les URL

    ind = []
    for i=1:size(U,1)
      if ~isempty(strindex(U(i),term))
      ind = [ind i] 
      end 
    end 
    
    if ~isempty(ind)
      xf = x(ind)
      Uf = U(ind)
      [xf,k] = gsort(xf)
      Uf = Uf(k)
      printf("Search result for ""%s"":\n\n",term)
      printf("%8s | %-40s\n","Rank","URL")
      printf("---------|---------------------------\n")  
      for i=1:length(ind)
          printf("%8.6f | %s\n",xf(i),Uf(i))
      end
      printf("\n")
    else
      printf("No result\n");
    end

endfunction

exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD4-Valeurs_Propres\4-Surfer_Mottellet.sce");

// Script principal
chdir(get_absolute_file_path("4-PageRank_Mottellet.sce"))

// chargement des matrices C (matrice d'adjacence) et U (les URL)
// déjà obtenues (voir surfer.sci)
//load www.utc.fr.dat
load surfdata.dat

ij = spget(C);
n = size(C,1)

clf
drawlater
plot(ij(:,2),size(C,2)-ij(:,1)+1,'.','markersize',5)
set(gca(),"tight_limits","on",'isoview','on', 'data_bounds', [0,n+1,0,n+1])
drawnow 

s = sum(C,1)
s(s<>0) = 1../s(s<>0)
lambda = diag(s)
e = ones(n,1)
f = ones(n,1)
f(s==0) = 0

x = rand(n,1)
q = 0.85;

// Bien noter les parenthèses qui évitent des calculs inutiles :
//
// C*(lambda*x) au lieu de C*lambda*x qui évite de multiplier les colonnes de C
// e*((e-q*f)'*x) au lieu de e*(e-q*f)'*x qui évite de former la matrice e*(e-q*f)'
//
for i=1:1000
    y = q*C*(lambda*x)+e*((e-q*f)'*x)/n
    mu = y'*x
    if norm(y-mu*x)<1e-10
        break
    end
    x = y/norm(y)
end

x = x/sum(x); // Normalisation pour que x soit bien un vecteur de probabilités

printf("\n\nConvergence après %d itérations\n\n",i)
// Affichage des N sites les mieux classés par ordre décroissant
N = 10;
[xs,k] = gsort(x)
printf("%8s | %-40s\n","Rank","URL")
printf("---------|---------------------------\n")
printf("%8.6f | %-40s\n", xs(1:N), U(k(1:N)))
printf("\n")

// exemple de recherches à partir de mots-clés contenus dans les URL et
// classés suivant le pagerank :

search(U,x,"startup")

