function unsolved
axis([-8 8 -6 6])
hold on;
grid on;

syms x y z

F = y - x*z - z^2;
Fz = diff(F, z);

[singy, singz] = solve(F, Fz, y, z );

x = -8:0.01:8;
sol = eval(singy);

plot(x, sol, 'k');

[x0, y0] = ginput(1);

plot(x0, y0, 'r*');

if y0 < x0^2 / 4
    text(x0 + 0.1, y0, 'no solution')
else 
    syms y(x)
    y1 = dsolve(y - x * diff(y, x) - (diff(y, x))^2 == 0, y(x0) == y0);
    x = -8:0.01:8;
    plot(x, eval(y1))

end
end
