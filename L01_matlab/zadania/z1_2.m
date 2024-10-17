clear all; close all;
a = -1; b = 2; c = 4;
function y = quadratic(x,a,b,c)
y = a*x.^2 + b*x + c;
end
p1 = (-b + sqrt(b^2 - 4*a*c))/2*a;
p2 = (-b - sqrt(b^2 - 4*a*c))/2*a;

disp("p1: " + p1);
disp("p2: " + p2);

function [x,y] = maksfun(a,b,c,start,ending)
% only if quadratic
if a > 0
    s = quadratic(start,a,b,c);
    e = quadratic(ending,a,b,c);
    if s > e
        y = s;
        x = start;
    else
        y = e;
        x = ending;
    end
else
    p = -b/2*a;
    x = p;
    y = quadratic(p,a,b,c);
end
end

function [x,y] = minfun(a,b,c,start,ending)
% only if quadratic
if a < 0
    s = quadratic(start,a,b,c);
    e = quadratic(ending,a,b,c);
    if s < e
        y = s;
        x = start;
    else
        y = e;
        x = ending;
    end
else
    p = -b/2*a;
    x = p;
    y = quadratic(p,a,b,c);
end
end

x = [-10:0.01:10];
f = quadratic(x,a,b,c);

plot(x,f); grid on; hold on;
[max_x,max_y] = maksfun(a,b,c,-10,10);
[min_x,min_y] = minfun(a,b,c,-10,10);

plot(max_x,max_y,"ro","MarkerSize",20);
plot(min_x,min_y,"ro","MarkerSize",20);