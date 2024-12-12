% optim_analyticgrad1.m
clear all; close all;

% Bungee jump
% z(t) - funkcja wysokosci
% z1p(t), z2p(t) - jej pierwsza i druga pochodna

z0 = 100; m = 80; c = 15; v0 = 55; g = 9.81;
z = @(t) ( z0 + m/c * (v0+(m*g)/c) * (1-exp(-(c/m)*t)) - ((m*g)/c)*t );
z1p = @(t) ( v0*exp(-(c/m)*t)-((m*g)/c)*(1-exp(-(c/m)*t)) );
z2p = @(t) ( (-(c/m)*v0-g)*exp(-(c/m)*t) );
t0 = (m/c)*log(1+(c*v0)/(m*g));

% Znajdz sam maksimum funkcji z(t) ...

z_n = @(t) -z(t);
z1p_n = @(t) -z1p(t);

options = optimoptions('fminunc', 'Algorithm', 'trust-region', 'Display', 'iter', 'SpecifyObjectiveGradient', true);
obj_fun = @(t) deal(z_n(t), z1p_n(t));
t_s = 0;
[t_max_wysokosc, n_max_wysokosc] = fminunc(obj_fun, t_s, options);

max_wysokosc = -n_max_wysokosc;

fprintf('Czas osiagnięcia najwiekszej wysokosci: %.4f seconds\n', t_max_wysokosc);
fprintf('Najwieksza wysokosc: %.4f meters\n', max_wysokosc);

t_vals = linspace(0, 10, 1000);
z_vals = arrayfun(z, t_vals);
plot(t_vals, z_vals, 'b-', 'LineWidth', 2);
hold on;
plot(t_max_wysokosc, max_wysokosc, 'ro', 'MarkerSize', 8, 'LineWidth', 2); % Mark maximum point
xlabel('Czas (s)');
ylabel('Wysokosc (m)');
title('Skok Bungee');
grid on;
hold off;