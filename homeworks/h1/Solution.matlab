function curve

axis([1 2 4 10])
hold on;
grid on;

xlabel('x');
ylabel('y');
title('Интегрална крива на задачата на Коши');

x0 = 1; 
y0 = 4;
syms y(x);

sol = dsolve(x * diff(y, x) == (12 * y^2 + 12 * x * y + 6 * x^2) / (8 * y + 6 * x), y(x0) == y0);

xvalid = (15 / 4) / (19^2 ++ 15 / 4) + 1;
x = xvalid:0.01:10;

plot(x, eval(sol), 'g')

end
