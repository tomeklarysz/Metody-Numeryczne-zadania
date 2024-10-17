clear all; close all;
a = 1; b = 10^6; c = 5;
x = -10:0.1:10;
f = a*x.^2 + b*x + c;
function [x1,x2] = solve_new(a,b,c)
x1 = (-b-sqrt((b^2)-4*a*c))/2*a;
x2 = 2*c/(-b-sqrt((b^2)-4*a*c));
end

function [x1,x2] = solve(a,b,c)
x1 = (-b-sqrt((b^2)-4*a*c))/2*a;
x2 = (-b+sqrt((b^2)-4*a*c))/2*a;
end

% plot(x,f); grid;
format long;

[p1,p2] = solve(a,b,c);
[p3,p4] = solve_new(a,b,c);

fprintf("klasycznie:\n")
fprintf("x1= %.15f, x2 =%.15f\n",p1,p2);
fprintf("inny sposob:\n")
fprintf("x1= %.15f, x2= %.15f\n",p3,p4);