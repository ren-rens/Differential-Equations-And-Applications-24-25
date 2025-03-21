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

plot(x, eval(sol), 'g');

end
