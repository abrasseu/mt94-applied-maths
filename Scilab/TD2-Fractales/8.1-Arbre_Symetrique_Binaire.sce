function branche(a,b,n, r, theta)
	if n==0 then
		plot(a, b);
	else
		plot(a,b);
        a = b;
        ba = b + r*[cos(theta); sin[theta];
        bb  = b + r*[cos(theta); -sin[theta];
        branche(a, ba, n-1, r,theta);
        branche(a, bb, n-1, r,theta);        
	end
endfunction


n = 100000;           // Nombre de points à calculer

theta = %pi/6;
r = 0.7;

A = [r*cos(theta), -r*sin(theta) ;
		r*sin(theta), r*cos(theta)];
B = [r*cos(theta), r*sin(theta) ;
		-r*sin(theta), r*cos(theta)];
C = [1, 0; 0, 1];

clf;
a = [0;0];
b = [0;1];
branche(a, b, 10, r, theta)

points = zeros(2,n);       // Ensemble des points
for i=2:n           // Premier point O(0,0)
    t = floor(3*rand(1)+1);
    select t
    case 1 then
		X(:,i)=T1( X(:,i-1) );
        points(:,i) = A*points(:,i-1) + [0;1];
    case 2 then
        points(:,i) = B*points(:,i-1) + [0;1];
    case 3 then
        points(:,i) = C*points(:,i-1);
    end
end

replot([0 0 1 1]);
plot(points(1,:),points(2,:),".",'markersize',1)

