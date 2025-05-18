function toscilator
t0 = 0; tmax = 60; k = 0; w = sqrt(5); y0 = 2; v0 = 1;
syms x(t) z(t)
[solX, solZ] = dsolve(diff(x, t) == z, diff(z, t) == -5 * x, ...
    x(0) == y0, z(0) == v0);
t = 0:0.05:60;
subplot(2, 1, 1)
plot(t, eval(solX), 'r')
[T, Y] = ode45(@ff, [t0, tmax], [y0, v0]);
subplot(2, 1, 2)
plot(T, Y(:,1))
end
function u = ff(t, y)
a = 2; w0 = sqrt(5) + 0.2;
u = [y(2); -5 * y(1) + a * cos(w0 * t)];
end
