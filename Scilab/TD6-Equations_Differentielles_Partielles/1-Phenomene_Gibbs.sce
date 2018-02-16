function y = carre(x)
for i=1:length(x)
    if x(i) < 0 then
    	if abs(modulo(x(i)-%pi,2*%pi))<=%pi then
	   	y(i) = 1
	   else
		  y(i) = -1
    	end
    else
    	if modulo(x(i),2*%pi)<=%pi then
	   	y(i) = 1
	   else
		  y(i) = -1
    	end
    end
end
endfunction

NB_PERIODE = 2;
NB_POINTS = 400;
NB_ITE = 50;

x = linspace(-NB_PERIODE*%pi,NB_PERIODE*%pi, NB_POINTS);
S = zeros(1,length(x));

for p=0:NB_ITE
	n = 2*p+1;
	S = S + 4*sin(n*x)/(n*%pi);
end

clf;
plot(x,carre(x)','k', x,S,'r');

