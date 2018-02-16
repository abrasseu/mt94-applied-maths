clear;
function dvdt = gravit(t,v)
	m1 = 5.975*10^24;
	m2 = 7.35*10^22;
	G = 6.67*10^(-11);
	// v = u1 u1' u2 u2'
	// u(x y)
	u1 = [v(1); v(2)];
	u1prim = [v(3); v(4)];
	u2 = [v(5); v(6)];
	u2prim = [v(7); v(8)];

	dvdt = [
		 u1prim,
		 G*m2*(u2-u1)/(norm(u2-u1)^3);
		 u2prim;
		 -G*m1*(u2-u1)/(norm(u2-u1)^3);
	 ];
endfunction 

m1 = 5.975e24;
m2 = 7.35e22;
d = 3.84402e8;
T = 27.55*24*60*60;
t0 = 0;
t = linspace(0,2*T,1000);

u1zero = [0; 0];
u2zero = [d; 0];
u1primzero = [0; 0];
u2primzero = [0; 2*%pi*d/T];

v0 = [u1zero; u1primzero; u2zero; u2primzero];
v = ode(v0,t0,t,gravit)

scf(0); clf;
Gx = ((m1*v(1,:) + m2*v(5,:))/(m1+m2));
Gy = ((m1*v(2,:) + m2*v(6,:))/(m1+m2));

plot(v(1,:)-Gx, v(2,:)-Gy, 'g',  v(5,:)-Gx, v(6,:)-Gy, 'b');
set(gca(),"isoview","on");

// Animation
scf(1); clf;
x = v([1 5],:);
y = v([2 6],:);
plot(x(1,1), y(1,1),'.',  x(2,1),y(2,1),'.');
h = gce();
set(gca(), 'isoview', 'on', 'data_bounds', [min(x) max(x) min(y) max(y)]);
for n = 2:length(t)
	h.children(1).data = [x(1,n) y(1,n)];
	h.children(2).data = [x(2,n) y(2,n)];
end
