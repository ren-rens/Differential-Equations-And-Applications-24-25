function numeric2

x0 = 0;
y0 = 3;
z0 = 0;
a = 20;

hold on; grid on;

axis([0 20 -3 4])
syms y(x)

Dy = diff(y, x);
sol = dsolve(diff(y, x, 2) == - 4 * y - 1 / 2 * Dy, y(x0) == y0, Dy(x0) == z0);
x = x0:0.01:a;

pa = plot(x, eval(sol), 'g');

h = [0.5, 0.2, 0.05];
c = ['r', 'k', 'b'];

for k = 1 : length(h)
    y = [];
    x = x0:h(k):a;
    
    y(1) = y0;
    y(2) = y(1) + h(k) * z0 + h(k)^2 * ff(x0, y0, z0) / 2;
    
    for n = 2 : length(x) - 1
        y(n + 1) = 2 * y(n) - y(n - 1) + h(k)^2 * ff(x(n), y(n), (y(n) - y(n - 1)) / h(k));
    end
    
    p(k) = plot(x, y, c(k));
end

legend([pa, p(1), p(2), p(3)], 'symbolic', 'h = 0.5', 'h = 0.2', 'h = 0.05', 'Location', 'southeast');

end

function u = ff(x, y, z)
u = -4 * y - 1 / 2 * z;
end
