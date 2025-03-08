function curve
hold on;
grid on;

axis([-10 10 -10 10])
[x0, y0] = ginput(1);

sol = dsolve(diff(y, x) == y / x * (1 + log(y / x)), y(x0) == y0);
x = -10:0.01:10;

plot(x, eval(sol))

end
