clear all;
x_j = 0;
x = linspace(-2, 2, 1000);

% przesunięcie u względem punktu x_j
u = x - x_j;

B_j3 = zeros(size(u));

% obliczenie kubicznych B-splajnów dla węzłów równoodległych
for i = 1:length(u)
    if 1 <= u(i) && u(i) <= 2
        B_j3(i) = ((1 - u(i))^3) / 6;
    elseif 0 <= u(i) && u(i) < 1
        B_j3(i) = (3 * u(i)^3 - 6 * u(i)^2 + 4) / 6;
    elseif -1 <= u(i) && u(i) < 0
        B_j3(i) = (-3 * u(i)^3 + 3 * u(i)^2 + 3 * u(i) + 1) / 6;
    elseif -2 <= u(i) && u(i) < -1
        B_j3(i) = (u(i)^3) / 6;
    end
end


% rysowanie wykresu
figure;
plot(x, B_j3, 'LineWidth', 2);
xlabel('x');
ylabel('B_{j,3}(x)');
grid on;

% sprawdzenie

% https://www.geogebra.org/graphing?lang=en 
% f: y=(((1-x)^(3))/(6))
% f: y=((3x^(3)-6x^(2)+4)/(6))
% f: y=((-3x^(3)+3x^(2)+3x+1)/(6))
% f: y=((x^(3))/(6))