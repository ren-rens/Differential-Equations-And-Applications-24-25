function curve
axis([-10 10 -10 10]);
hold on;
grid on;

[x0, y0] = ginput(1);
c = sqrt(x0^2 + y0^2);

sums y(x);
xv = -c:0.01:c;

plot(x0, y0)

sol = dsolve(y * diff(y, x) == -x, y(x0) == y0);
plot(xv, eval(sol))

end
