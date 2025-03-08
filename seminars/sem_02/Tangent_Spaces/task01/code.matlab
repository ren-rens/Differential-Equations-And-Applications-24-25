function slopef
x = -5:0.01:5;
y = -5:0.01:5;
axis([-5 5 -5 5])
delta = 0.2;

hold on;

for k = 1 : length(x)
  for m = 1 : length(y)
    epsi = delta / sqrt(ff(x(k), y(m))^2 + 1);
    plot([x(k) - epsi, x(k) + epsi], [y(m) - epsi * ff(x(k), y(m)), [y(m) + epsi * ff(x(k), y(m))], 'k')
  end
end

function z = ff(x, y)
z = -x / y;
end

syms y(x);
[x0, y0] = ginput(1);

sol = dsolve(diff(y, x) == x / y, y(x0) == y0);
x = -sqrt(y0^2 - x0^2) : 0.01 : sqrt(y0^2 - x0^2);
plot(x, eval(sol))

end
