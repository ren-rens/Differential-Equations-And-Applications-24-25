function curve
axis([-10 10 -20 20])
hold on;
grid on;

[x0, y0] = ginput(1);

k = 1;
syms y(x);
xv = -10:0.01:10;

plot(x0, y0, 'r*')

sol = dsolve(x * diff(y, x) == k * y, y(x0) == y0);
plot(xv, eval(sol))

end
