fucntion curve
axis([-4 4 -10 10])
hold on;
grid on;

[x0, y0] = ginput(1);
c = atan(y0) - x0;
[X, Y] = ode45(@ff, [x0:0.01:pi/2 + c - eps], y0);
[X1, Y1] = ode45(@ff, [x0:0.01:-pi/2 + c + eps], y0);

plot(X, Y, 'r', X1, Y1, 'r')

function x = ff(x, y)
z = 1 + y^2;
end

end
