clear all; close all;
a = 1; b = 5; c = 6;
p1 = (-b + sqrt(b^2 - 4*a*c))/2*a;
p2 = (-b - sqrt(b^2 - 4*a*c))/2*a;

disp("p1: " + p1);
disp("p2: " + p2);

x = [-10:0.01:10];
f = a*x.^2 + b*x + c;
plot(x,f); grid on;