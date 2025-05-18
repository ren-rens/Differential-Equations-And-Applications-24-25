function Eulersyst
syms x(t) y(t) z(t)
[solX, solY, solZ] = dsolve(diff(x, t) == x + y + z + 2 * exp(3 * t), ...
    diff(y, t) == -x + 3 * y + 4 * exp(3 * t), ...
    diff(z, t) == x - y + z, ...
    x(0) == 1, y(0) == -1, z(0) == 0);
t = 0:0.01:1.5;
A = eval(solX); B = eval(solY); C = eval(solZ);
plot(t, A, 'r', t, B, 'g', t, C, 'b')
hold on; grid on;
axis([0 1.5 -30 50])
h = [0.5, 0.05, 0.03];
for m = 1 : length(h)
    x = []; y = []; z = [];
    t = 0:h(m):1.5;
    x(1) = 1; y(1) = -1; z(1) = 0;
    for k = 1 : length(t) - 1
        x(k + 1) = x(k) + h(m) * (x(k) + y(k) + z(k) + 2 * exp(3 * t(k)));
        y(k + 1) = y(k) + h(m) * (-x(k) + 3 * y(k) + z(k) + 4 * exp(3 * t(k)));
        z(k + 1) = z(k) + h(m) * (x(k) - y(k) + z(k));
    end
   if m == 1
       plot(t, x, 'r--', t, y, 'g--', t, z, 'b--');
   elseif m == 2
       plot(t, x, 'r*', t, y, 'g*', t, z, 'b*');
   else
       plot(t, x, 'r:', t, y, 'g:', t, z, 'b:');
   end
end
   legend('solX', 'solY', 'solZ', ...
            'solXh1', 'solYh1', 'solZh1', ...
            'solXh2', 'solYh2', 'solZh2', ...
            'solXh3', 'solYh3', 'solZh3')
end
