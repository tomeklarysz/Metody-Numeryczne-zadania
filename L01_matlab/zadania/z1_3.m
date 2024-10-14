clear all;
close all;
S = 21*29.7;
% S = 2*pi*r*h + 2*pi*r^2
% h = (S - 2*pi*r.^2)/2*pi.*r;

% obj = pi*r^2*h;
% wstawiamy h do wzoru na objętość żeby
% mieć wzór zależny tylko od promienia r
f = @(r) pi*r.^2.*((S - 2*pi*r.^2)/2*pi.*r);

r_max = round(sqrt(S/(2*pi)));
r = 0:0.1:r_max;
y = f(r);
pochodna = gradient(y,r);
plot(r,pochodna);

% szukamy miejsca zerowego pochodnej
x = fzero(@(z) interp1(r,pochodna,z),[0,r_max]);
disp("miejsce zerowe: " + x);

% h = (S - 2*pi*x.^2)/2*pi.*x,
% 
% check = 2*pi*x*h + 2*pi*x^2,
% disp(S);