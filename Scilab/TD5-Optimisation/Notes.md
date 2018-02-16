# Notes TD 5

## Régression polynomiale

### Explications

#### Choix du degré d'arrêt
Résidu important si le modèle ne fit pas correctement les données à cause d'un degré trop petit

Au delà d'un certain degré, plus de changement visuel
Si degré trop important : modélisation du bruit, pas intéressant

#### Validation
- Séparer les données en deux partitions
    -> Choix par indices pairs/impairs, inf/sup à une valeur (mauvaise idée car après extrapolation assez brutale)
    + Un set de données d'apprentissage pour établir les différents modèles
    + Un set de données de validation pour calculer l'erreur
- On choisit le modèle avec l'**erreur de validation minimale**

**Validation croisée :**
Il faut que toutes les données servent une fois dans chaque set

But : trouver le polynome qui colle le mieux aux données

Matrice A est une **matrice de Vandermonde**

Si solution est dans un espace vectoriel, on peut faire du LLS.
On utilise la famile des polynomes car elle forme une base de l'espace vectoriel.

Approcher les données par une constante donne la moyenne.

Si degré beaucoup trop grand:
problème avec rang : << n+1
car avec la précision machine il n'y a que x < rangA colonnes linéairement indépendantes

Si rang pas plein, solution pas unique et Scilab renvoie une solution pas de norme minimale mais avec le plus de coeff nuls => cas très dégénérés

Intervalle de confiance
Méthode de Monte-Carlo
Bruiter x fois un jeu de données et le résoudre => trace épaisse des polynomes de même degré possible

Final : avec jeu de données et famille de polynomes, trouver la bonne et les coeff par validation

Si linéaire : algèbre linéaire A\theta...
Sinon


**Interpolation :**
n+1 points d'abscisses distinctes, il existe un unique polynome de degré n (n+1 coeff) qui passe par tous les points

### Exercices

##### Unicité
Il faut que rang A = nb col
Pour vérifier : prendre trois lignes $i,j,k$ et exprimer le déterminant de cette sous-matrice pour donner des conditions sur trois points $t_i, t_j, t_k$ :
(peut être montré par récurrence)
$$
A' = \begin{pmatrix}
        ad
    \end{pmatrix}
$$




## Débruitage d'une image

Trouver un modèle polynomiale à deux variables $x$ et $y$


## Optimisation de pb non-linéaires

$$
\theta^* = \arg \min \norm{r(\theta)}^2
$$
Avec r : $\R^p \to \R^n$

Courbe iso valeurs : f(x) = C ?
Montrer en se mettant dans bases vecteurs propres
fonction `trace_iso.sce`



### Méthode du gradient


Partir de $x_0$, construire la suite :
$$
    x_{n+1} = x_n - \rho_k d_k
$$
Avec la direction $d_k = grad f(x_n)$ orthogonale à la tangente en $x_0$ ??

```scilab
    Partir de x0
    Tant que (\norm \grad f > \epsilon) {
        Tracer la courbe isovaleur
        Calculer le pas et la direction
        Avancer    
    }
```

Pas constant puis 
Pas optimal : va au minimum de la courbe décrite par la coupe transversale faite selon la direction du gradient ? directions successives orthogonales entre elles (syst linéaire)

Limite : fonction de Rosenbrock
Algo très lent, comparer grad vs LM

Essayer sur régression non-linéaire:
On pourrait passer en log pour passer au linéaire, comparer cette astuce avec vraiment non-linéaire

### Méthode de Levenberg-Marquardt



`spec` vs `bdiag` => méthode diagonalisation par block ?

Matrice A // max min

! Si pas de min => diverge ?

Vérif des cas min max selle avec les valeurs propres de la forme quadratique