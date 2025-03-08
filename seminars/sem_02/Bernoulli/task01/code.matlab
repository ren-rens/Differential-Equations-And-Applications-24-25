function curve
hold on;
grid on;

axis([-10 10 -10 10])
syms y(x);

sol = dsolve(3 * x * diff(y, x) + 4 * x^5 * y^4 == 2 * y, y(1) == 1 / 2);
x = -10:0.01:10;
plot(x, eval(sol))

dy = diff(sol);
a = double(solve(dy));

d2y = diff(sol, 2);
b = double(solve(d2y));

x = a(1);
plot(x, eval(sol), 'r');

x = b(2);
plot(x, eval(sol), 'bo')

end
