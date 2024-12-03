clear all; close all;

if(0) A = [ 4 0.5; 0.5 1 ];       % wybor/definicja symetrycznej macierzy kwadratowej
else  A = magic(6);
end
[ N, N ] = size(A);               % wymiar 

x = ones(N,1);                    % inicjalizacja
for i = 1:20                      % poczatek petli
    y = A*x;                      % pierwsze mnozenie
    [ymax,imax] = max(abs(y));    % najwieksza wartosc abs() i jej indeks
    x = y/ymax;                   % wektor wlasny
    y_n = norm(y);
    x_n = y/norm(y);
    lambda = ymax;                % wartosc wlasna ymax=y(imax)
end                               % koniec petli
x, x_n, lambda,                   
[ V, D ] = eig(A)                 % porownaj z funkcja Matlaba  
    
% różnica tkwi w normalizacji-
% w implementacji matlabowego eig()
% normalizujemy inaczej (L2)