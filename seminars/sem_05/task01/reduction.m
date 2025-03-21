function reduction

syms y(x)
hold on; grid on;

Dy  = diff(y, x);
DDy = diff(y, x, 2);

sol = simplify(dsolve(diff(y, x, 3) == 2 * (DDy - 1) * cot(x), y(pi/2) == 1, Dy(pi/2) == 0, DDy(pi/2) == 1));
x = -5:0.01:5;
y = eval(sol);

plot(x, y, 'g')

[m, m_i] = min(y);
[M, M_i] = max(y);

plot(x(m_i), m, 'bo', x(M_i), M, 'r*')

end
