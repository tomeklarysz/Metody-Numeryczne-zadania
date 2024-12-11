clear all; close all;

% pocisk
alpha = pi/6;
v0 = 125;
m = 8;
b = 0.1; % wsp. oporu powietrza (kg/m)
g = 9.81;

% funkcja f(x) z równania (9.1)
f = @(x) -((tan(alpha) + (m*g)/(b*v0*cos(alpha)))*x + (g*m^2)/(b^2)*log(1 - (b*x)/(m*v0*cos(alpha))));

% zakres wyszukiwania (przyjmujemy x od 0 do maksymalnego zasięgu)
max_x = (m*v0*cos(alpha))/b; % max zasieg poziomo
a = 0;
b = max_x;

% Golden search
k = (sqrt(5) - 1) / 2; % Współczynnik złotego podziału
xL = b - k * (b - a);
xR = a + k * (b - a);

x=0:0.1:1000;

plot(x,-f(x),'b');

iter = 0; % Licznik iteracji
while (b - a) > 1e-6
    if( f(xL)<f(xR) )
        b = xR; xR = xL; xL = b-k*(b-a);
    else
        a = xL; xL = xR; xR = a+k*(b-a);
    end
    iter = iter + 1;
end

xopt = (a + b) / 2; % zasieg dla maksymalnej wysokosci
yopt = -f(xopt); % max wysokosc

fprintf('Maksymalna wysokosc: %f dla x = %f\n',yopt,xopt);
fprintf('Iteracje = %d\n',iter);
