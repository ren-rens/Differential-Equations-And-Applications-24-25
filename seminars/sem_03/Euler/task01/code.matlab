function Euler
x0 = 0;
y0 = 1;
a = 2;

hold on; 
grid on;
syms y(x)

sol = dsolve(diff(y, x) + y * tan(x) == cos(x)^2, y(x0) == y0);
x = linspace(x0, a);
Exact = plot(x, eval(sol), 'k');

h = [0.5, 0.1, 0.01];
c = ['b', 'r', 'g'];

for k = 1:length(h)
    sol(1) = y0;
    x = x0:h(k):a;
    
    for m = 1:length(x) - 1
        sol(m+1) = sol(m) + h(k)*(cos(x(m))^2 - sol(m)*tan(x(m)));
    end
    
    h(k) = plot(x, sol, c(k));
end

legend([Exact, h(1), h(2), h(3)], 'Exact solution', 'h = 0.5', 'h = 0.1', 'h = 0.01', 'South east')

xlabel('x')
ylabel('y')
title('Euler')

end
