NB_PERIODE = 2;
NB_POINTS = 400;
NB_ITE = 50;

x = linspace(0,1, NB_POINTS);
Sc = zeros(1,length(x));	// Série f continue
Sd = zeros(1,length(x));	// Série f discontinue

Sc = Sc + %pi/2
for p=0:NB_ITE
	n=2*p+1;
    Sc = Sc -4/%pi * cos(n*x)/(n^2);
    Sd = Sd + 2/(n*%pi) * (-1)^(n+1) * sin(n*x);
end

clf;
plot(x, Sc);
plot(x, Sd);
