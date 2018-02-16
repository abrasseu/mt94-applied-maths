r = 1/2;
D = [1/2; 0];
H = [1/4; sqrt(3)/4];
n = 100000;

W = zeros(2, n);
for i=1:n-1
    t=floor(3*rand(1)+1);
    select t
    case 1 then
        W(:, i+1) = r*W(:,i);
    case 2 then
        W(:, i+1) = r*W(:,i) + D;
    case 3 then
        W(:, i+1) = r*W(:,i) + H;       
    end
end

clf;
replot([0 0 1 1]);
set(gca(), "isoview", "on");
//title(sprintf('$$\\huge %d Points$$',n));
plot(W(1,:),W(2,:),".",'markersize',1)
