n=10;
u=zeros(n,1);
u(1:2) = [1;1];

for i = 1:n-2
    u(i+2) = u(i+1) + u(i);
end
disp(u)
