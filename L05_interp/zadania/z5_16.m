% Funkcja obliczająca B-splajn kubiczny B_{j,3}(x)
function B_j3 = B_spline(x, x_j)
    % Oblicz przesunięcie u względem punktu x_j
    u = x - x_j;
    % Inicjalizacja macierzy wynikowej B_j3 o tych samych rozmiarach co u
    B_j3 = zeros(size(u));
    
    % Przypisanie wartości funkcji B-splajnu w każdym przedziale
    B_j3(1 <= u & u < 2) = ((1 - u(1 <= u & u < 2)).^3) / 6;
    B_j3(0 <= u & u < 1) = (3 * u(0 <= u & u < 1).^3 - 6 * u(0 <= u & u < 1).^2 + 4) / 6;
    B_j3(-1 <= u & u < 0) = (-3 * u(-1 <= u & u < 0).^3 + 3 * u(-1 <= u & u < 0).^2 + 3 * u(-1 <= u & u < 0) + 1) / 6;
    B_j3(-2 <= u & u < -1) = (u(-2 <= u & u < -1).^3) / 6;
end

% Parametry wykresu
x_j = 0; % Możemy przyjąć x_j = 0 dla uproszczenia
x = linspace(-3, 3, 1000); % Zakres wartości x dla wykresu
B_j3_values = B_spline(x, x_j); % Obliczanie wartości B-splajnu dla x

% Rysowanie wykresu
figure;
plot(x, B_j3_values, 'LineWidth', 2);
xlabel('x');
ylabel('B_{j,3}(x)');
title('Kubiczny B-splajn zdefiniowany przez wzór (5.36)');
grid on;
