function unsolved
% Discriminant Curve
axis([-8 8 -6 6])
hold on;
grid on;

syms x y z

F = z^2 - x * z - x^2 + 5 * y;
Fz = diff(F, z);

[singy, singz] = solve(F, Fz, y, z);

x = -8:0.01:8;
sol = eval(singy);

plot(x, sol, 'k');

% Solutions

[x0, y0] = ginput(1);
plot(x0, y0, 'r*');

if y0 > x0^2 / 4
  text(x0 + 0.1, y0, 'no solution')
else
  syms y(x)
  y1 = dsolve((diff(y, x))^2 - x * diff(y, x) - x^2 + 5 * y == 0, y(x0) == y0);
  x = -8:0.01:8;

  plot(x, eval(y1))
end
end
