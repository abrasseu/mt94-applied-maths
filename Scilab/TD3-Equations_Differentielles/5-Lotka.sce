clear;
function dYdt = fLotka(t,Y)
	x = Y(1);  // Proies
	y = Y(2);  // Prédacteurs

	a = 2/3;
	b = 4/3;
	c = 1;
	d = 1;

	dYdt = [
		x*(a - b*y);
		y*(c*x - d)
	];
endfunction

exec("D:\Documents\Cours\TC04 - Printemps 2017\MT94\Scilab\TD3-Equations_Differentielles\0-Tous_Schemas.sce");

t = 1:.1:20;
UPTO = 7;
proies = coolcolormap(1.8*UPTO);
predateurs = hotcolormap(1.8*UPTO);
total = jetcolormap(UPTO);

scf(0); clf;
scf(1); clf;
for i=1:UPTO
    y0 = [1+(i-4)/10; 1-(i-4)/10];
    y = RungeKutta(y0, t, fLotka);
    disp(y0)
    scf(0);
    plot(t, y(1,:), 'Foreground', proies(i,:));
    plot(t, y(2,:), 'Foreground', predateurs(i,:));
    
    scf(1);
    set(gca(), 'isoview','on');
    plot(y(1,:),y(2,:), 'Foreground', total(i,:));
end
xtitle("Cycles", "Proies", "Prédateurs");
scf(0);
legend("Proies","Prédateurs",2)
