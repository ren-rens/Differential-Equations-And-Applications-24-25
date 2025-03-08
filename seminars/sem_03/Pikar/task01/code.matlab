function Pikar
xmn = -4;
xmx = 4; 
x0 = 0; 
y0 = 1;

hold on; grid on;

axis([xmn xmx -10 20])
syms y(x)

sol = dsolve(diff(y, x) == 2 * y, y(x0) == y0);
x = xmn:0.01:xmx;
p0 = plot(x, eval(sol), 'k');

N = 5;

x = linspace(x0, xmn);
xx = linspace(x0, xmx);

z = y0 * ones(1, length(x));
zz = y0* ones(1, length(xx));

p1 = plot(x, z, 'b');
plot(xx,zz,'b')

for k = 1:N
    z = y0 + cumtrapz(x, ff(x,z));
    zz = y0 + cumtrapz(xx, ff(xx,zz));
    if k == 2
        p2 = plot(x, z, 'r');
        plot(xx, zz, 'r')
    else if k == 5
            p5 = plot(x,z,'g');
            plot(xx,zz,'g')
    end
    end
end
end

function z = ff(x,y)
z = 2*y
end
