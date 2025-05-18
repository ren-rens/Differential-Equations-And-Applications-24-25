function stringdiffs
    L = 3;
    T = 10;
    a = 1/4;
    h = L / 100;
    tau = T / 250;
    c = (a * tau) / h;
    x = 0:h:L;
    t = 0:tau:T;
    
    for i = 1 : length(x)
        for j = 1 : length(t)
            if i > 1 && i < length(x)
                if j == 1
                    u(i, j) = phi(x(i));
                elseif j == 2
                    u(i, j) = c^2 / 2 * (phi(x(i + 1)) - 2 * phi(x(i)) + phi(x(i - 1))) + phi(x(i)) + tau * psi(x(i)) + tau^2 * f(x(i), t(1));
                else
                    u(i, j) = 2 * (1 - c^2) * u(i, j - 1) + c^2 * (u(i + 1, j - 1) + u(i - 1, j - 1)) - u(i, j - 2) + tau^2 * f(x(i), t(j - 1));
                end
            elseif i == 1
                u(i, j) = mu(t(j));
            else
                u(i, j) = ni(t(j));
            end
        end
    end
    
    for k = 1 : length(t)
        clf;
        hold on;
        y = u(:, k);
        plot(x, y, 'r');
        grid on;
        axis([0 L - 5 5])
        getframe;
    end
    clf;
    subplot(3, 1, 1)
    plot(x, u(:, 1), 'r')
    axis([0 L -5 5])
    subplot(3, 1, 2)
    plot(x, u(:, 50), 'r')
    axis([0 L -5 5])
    subplot(3, 1, 3)
    plot(x, u(:, 250), 'r')
    axis([0 L -5 5])
end

function y = phi(x)
    y = 0;
end

function y = psi(x)
    y = sin(pi * x)^2;
end

function y = mu(t)
    y = sin(pi/2 * t)^3;
end

function y = ni(t)
    y = t^2 * sin(t);
end

function y = f(x, t)
    y = t * exp(-t) * (x - 3)^3;
end
