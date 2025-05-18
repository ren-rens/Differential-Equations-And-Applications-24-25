function Lotka_Volterra
    tmax = 10;
    a = 1; b = 0.3; c = 1; d = 0.2;
    x = -1:0.5:c-d+15;
    y = -1:0.5:a/b + 10;
    axis([-1 c/d+15 -1 a/b+10])
    hold on
    plot(0, 0, 'r*', c/d, a/b, 'r*')
    [X, Y] = meshgrid(x, y);
    DX = a*X - b*X.*Y;
    DY = c*Y + d*X.*Y;
    d = sqrt(DX.^2 + DY.^2);
    quiver(X, Y, DX./d, DY./d, 'k')
    
    [x0, y0] = ginput(1);
    plot(x0, y0, 'g*')
    [T,Y] = ode45(@ff, [0, tmax], [x0, y0]);
    for k = 1:length(T)
        plot(Y(1:k, 1), Y(1:k, 2), 'r')
        M(k) = getframe;
    end
end
function u = ff(t, y)
    a = 1; b = 0.3; c = 1; d = 0.2;
    u = [a * y(1) - b * y(1) * y(2); -c * y(2) + d * y(1) * y(2)];
end
