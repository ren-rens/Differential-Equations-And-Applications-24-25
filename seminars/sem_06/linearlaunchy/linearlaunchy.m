function linearlauchy
b = [-1, 13, 0];
[T, Z] = ode45(@ff, [0,3], b);
plot(T, Z(:, 1), T, Z(:,2), T, Z(:,3))
legend('sol', 'D1', 'D2');
end
function u = ff(~, y)
u = [y(2); y(3); ...
    -13 * y(2) - 4 * y(3)];
end
