// Vecteurs de décalage
r = 1/3;
right   = [r; 0; 0];
back    = [0; r; 0];
up      = [0; 0; r];


n = 100000;

point = [0,0,0];
points = zeros(3,n);
for i=2:n
	t = floor(20*rand(1)+1);
	select t
		case 1 then
			points(:,i) = r*points(:,i-1);
		case 2 then
			points(:,i) = r*points(:,i-1) + right;
		case 3 then
			points(:,i) = r*points(:,i-1) + 2*right;
		case 4 then
			points(:,i) = r*points(:,i-1) + back;
		case 5 then
			points(:,i) = r*points(:,i-1) + back + 2*right;
		case 6 then
			points(:,i) = r*points(:,i-1) + 2*back;
		case 7 then
			points(:,i) = r*points(:,i-1) + 2*back + right;
		case 8 then
			points(:,i) = r*points(:,i-1) + 2*back + 2*right;
		case 9 then
			points(:,i) = r*points(:,i-1) + up;
		case 10 then
			points(:,i) = r*points(:,i-1) + up + 2*right;
		case 11 then
			points(:,i) = r*points(:,i-1) + up + 2*back;
		case 12 then
			points(:,i) = r*points(:,i-1) + up + 2*back + 2*right;
		case 13 then
			points(:,i) = r*points(:,i-1) + 2*up;
		case 14 then
			points(:,i) = r*points(:,i-1) + 2*up + right;
		case 15 then
			points(:,i) = r*points(:,i-1) + 2*up + 2*right;
		case 16 then
			points(:,i) = r*points(:,i-1) + 2*up + back;
		case 17 then
			points(:,i) = r*points(:,i-1) + 2*up + back + 2*right;
		case 18 then
			points(:,i) = r*points(:,i-1) + 2*up + 2*back;
		case 19 then
			points(:,i) = r*points(:,i-1) + 2*up + 2*back + right;
		case 20 then
			points(:,i) = r*points(:,i-1) + 2*up + 2*back + 2*right;
	end

end

clf;
set(gca(), "isoview", "on")
param3d1(points(1,:), points(2,:), points(3,:));
 
a = get("current_axes");
h = a.children;
h.line_mode = "off";
h.mark_mode = "on";
h.mark_size = 0;
h.mark_foreground = 3;
