function unsolved
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

end
