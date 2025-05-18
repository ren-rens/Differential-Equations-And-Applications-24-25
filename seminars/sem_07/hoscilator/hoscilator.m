function hoscilator
t0 = 0; tmax = 30; y0 = 0; v0 = 1; w = 4; k = 0;
syms y(t)
dy = diff(y, t);
sol = dsolve(diff(y, t, 2) + k * dy + w^2 * y == 3 * sin(t/2), y(0) == y0, dy(0) == v0);
dy = diff(sol, t);
t = 0:0.05:30;
A = eval(sol); B = eval(dy);
for k = 1 : length(t)
    subplot(4, 1, 1)
    plot(t(1:k), A(1:k), 'r')
    axis([t0 tmax -2 2])
    xlabel('t')
    ylabel('y(t)')
    title('Решение')
    subplot(4, 1, 2)
    plot(t(1:k), B(1:k), 'g')
    axis([t0 tmax -5 5])
    xlabel('t')
    ylabel('dy(t)')
    title('Velocity')
    subplot(4, 1, 3:4)
    plot(A(1:k), B(1:k), 'b')
    axis([-5 5 -5 5])
    xlabel('y(t)')
    ylabel('dy(t)')
    title('curve')
    M(k) = getframe;
end
end
