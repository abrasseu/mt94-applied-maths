clear;
exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD4-Valeurs_Propres\3-Rank.sce");

Villes = ["Varèse"; "Milan"; "Pavie"; "Lodi"; "Côme"; "Bergame"; "Crémone"; "Lecco"; "Sondrio"; "Brescia"; "Mantoue"];
[G R] = Rank('D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD4-Valeurs_Propres\villes.csv');

// Affichage du rank trié
[Rs,s] = gsort(R);
printf("  %8s | %-20s\n","Rank","Villes");
printf(" ----------|------------\n");
printf("  %8.6f | %2d - %-16s\n", Rs, s, Villes(s));
printf("\n");
