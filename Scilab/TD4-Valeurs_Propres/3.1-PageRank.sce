clear;
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD4-Valeurs_Propres\3-Rank.sce");

[G R] = Rank('D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD4-Valeurs_Propres\web1.csv');

// Affichage du rank trié
[Rs,s] = gsort(R);

printf("\n");
printf("  %8s | %-10s\n","Rank","Page");
printf(" ----------|------------\n");
printf("  %8.6f | %-10d\n", Rs, s);
printf("\n");
