r = 1/3;            // Réduction
D = [1/3; 0];       // Matrice de translation à droite
H = [0;   1/3];     // Matrice de translation en haut
n = 100000;         // Nombre de points à calculer

W = zeros(2,n);     // Ensemble des points
for i=2:n           // Premier point O(0,0)
    t=floor(8*rand(1)+1);
    select t
    case 1 then
        W(:,i) = r*W(:,i-1);
    case 2 then
        W(:,i) = r*W(:,i-1) + D;
    case 3 then
        W(:,i) = r*W(:,i-1) + 2*D;
    case 4 then
        W(:,i) = r*W(:,i-1) + H;
    case 5 then
        W(:,i) = r*W(:,i-1) + 2*D + H;
    case 6 then
        W(:,i) = r*W(:,i-1) + 2*H;
    case 7 then
        W(:,i) = r*W(:,i-1) + 2*H + D;
    case 8 then
        W(:,i) = r*W(:,i-1) + 2*D + 2*H;
    end
end

clf;
replot([0 0 1 1]);
set(gca(), "isoview", "on");
//title(sprintf('$$\\huge %d Points$$',n));
plot(W(1,:),W(2,:),".",'markersize',1)

