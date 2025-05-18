function non_linear_phaser_portrait
k = 1; tmax = 5;
A = [0, 1; (-1)^k, -(1)^k]; 
ak = k*pi; bk = 0;
d=5; s=1;
x = ak - d:s:ak + d;
y = bk - d:s:bk + d;
[X, Y] = meshgrid(x, y);
for i = 1:length(x)
    for j = 1:length(y)
        [T, Z] = ode45(@fl, [0, tmax], [X(i, j), Y(i, j)]);
        [T1, Z1] = ode45(@fl, [0, -tmax], [X(i, j), Y(i, j)]);
        [T2, Z2] = ode45(@ff, [0, tmax], [X(i, j), Y(i, j)]);
        [T3, Z3] = ode45(@ff, [0, -tmax], [X(i, j), Y(i, j)]);
        subplot(2, 1, 1)
        title('non-linear system')
        hold on
        plot(ak, bk, 'r*', ak - pi, bk, 'g*',ak + pi, bk, 'g*')
        plot(Z2(:,1), Z2(:,2), 'b', Z3(:,1), Z3(:,2), 'b')
        axis([ak - d - 1 ak + d + 1 bk - d - 1 bk + d + 1])
        subplot(2, 1, 2)
        title('linear system')
        hold on
        plot(ak, bk, 'r*')
        plot(Z(:,1), Z(:,2), 'b', Z1(:,1), Z1(:,2), 'b')
        axis([ak - d - 1 ak + d + 1 bk - d - 1 bk + d + 1])
    end
end
DX = Y;
DY = sin(X + Y);
d = sqrt(DX.^2 + DY.^2);
subplot(2, 1, 1)
quiver(X, Y, DX./d, DY./d, 'r')
DXL = A(1, 1) * (X - ak) + A(1, 2) * (Y - bk);
DYL = A(2, 1) * (X - ak) + A(2, 2) * (Y - bk);
dL = sqrt(DXL.^2 + DYL.^2);
subplot(2, 1, 2)
quiver(X, Y, DXL./dL, DYL./dL, 'r')
end
function z=ff(t,y)
z = [y(2); sin(y(1) + y(2))];
end
function u = fl(t,y)
k = 1;
A = [0, 1; (-1)^k, (-1)^k];
ak = k * pi; bk = 0;
u = A * [y(1) - ak; y(2) - bk];
end
