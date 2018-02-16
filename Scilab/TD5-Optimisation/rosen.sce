// clf;
UPTO = 200;
PAS = 5;
set(gca(), 'isoview','on', 'auto_scale','off','data_bounds',[-1 2 -1 2]);
colors = jetcolormap(floor(UPTO/PAS) + 1);

t = linspace(0,2*%pi,1024);
for c = 1:PAS:UPTO
    y = sqrt(c)*[cos(t);sin(t)];
    x = [
    		1 - y(1,:)
		    y(2,:)/10 + (1 - y(1,:)).^2
	    ];
    plot(x(1,:), x(2,:), 'Foreground', colors(floor(c/PAS)+1, :));
end
plot(1,1,'xr');
clear x y t PAS UPTO colors;