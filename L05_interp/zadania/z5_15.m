clear all;
x = 0:1:10;
y = sin(x);

% liczba splajnów
n = length(x) - 1;

% inicjalizacja macierzy A (współczynników układu równań)
A = zeros(4 * n);
% inicjalizacja wektora wyników b
b = zeros(4 * n, 1);

% numer wiersza
row = 1;

% warunki interpolacji
for i = 1:n
    % pierwszy punkt przedziału i
    A(row, (i-1)*4 + 1:(i-1)*4 + 4) = [x(i)^3, x(i)^2, x(i), 1];
    b(row) = y(i);
    row = row + 1;
    
    % drugi punkt przedziału i
    A(row, (i-1)*4 + 1:(i-1)*4 + 4) = [x(i+1)^3, x(i+1)^2, x(i+1), 1];
    b(row) = y(i+1);
    row = row + 1;
end

% warunki ciągłości pierwszej pochodnej
for i = 1:n-1
    A(row, (i-1)*4 + 1:(i-1)*4 + 3) = [3*x(i+1)^2, 2*x(i+1), 1];
    A(row, i*4 + 1:i*4 + 3) = [-3*x(i+1)^2, -2*x(i+1), -1];
    row = row + 1;
end

% warunki ciągłości drugiej pochodnej
for i = 1:n-1
    A(row, (i-1)*4 + 1:(i-1)*4 + 2) = [6*x(i+1), 2];
    A(row, i*4 + 1:i*4 + 2) = [-6*x(i+1), -2];
    row = row + 1;
end

% warunki brzegowe (druga pochodna na krańcach)
A(row, 1:2) = [6*x(1), 2];
b(row) = 0;
row = row + 1;

A(row, end-3:end-2) = [6*x(end), 2];
b(row) = 0;

% rozwiązywanie układu równań
wsp = A\b;
% zoptymalizowany tryb rozwiazywania równan liniowych
% Ax=b w Matlabie, sygnalizowany zapisem x=A\b, w którym jest 
% analizowana postac/wartosci macierzy A i wektora b oraz
% jest wybierana metoda optymalna z dostępnych

% wyświetlanie współczynników
disp('Współczynniki (a, b, c, d) dla każdego przedziału:');
for i = 1:n
    fprintf('S_%d(x): a = %.4f, b = %.4f, c = %.4f, d = %.4f\n', ...
        i-1, wsp((i-1)*4 + 1:(i-1)*4 + 4));
end

% sprawdzenie:

xi = 0:0.01:10;
yi = interp1(x,y,xi,'cubic');
% yl = interp1(x,y,xi, "linear");
% plot(xi,yl,'k');
figure; plot(xi,yi,'r'); 
hold on;
plot(x, y, 'ro', 'MarkerSize', 8, 'DisplayName', 'Punkty węzłowe');
xlabel('x'); title('y(x)'); grid;


for i = 1:n
    x_vals = linspace(x(i), x(i+1), 100);
    y_vals = wsp((i-1)*4 + 1)*x_vals.^3 + wsp((i-1)*4 + 2)*x_vals.^2 + wsp((i-1)*4 + 3)*x_vals + wsp((i-1)*4 + 4);
    % plot(x_vals, y_vals, 'b', 'LineWidth', 1.5, 'DisplayName', ['Przedział ' num2str(i)]);
    plot(x_vals, y_vals, 'b');
    
end

