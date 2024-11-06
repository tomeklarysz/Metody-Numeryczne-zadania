% interp_lagrange.m
clear all; close all;;
x = [5, 6, 8, 11]; y = [-2, 3, 7, 10]; % zadane punkty = wezly
xi = [5: 0.05 : 13]; % gdzie obliczyc nowe wartosci funkcji
disp(length(xi));
[yi,a] = funTZ_lagrange(x,y,xi); % nasza funkcja interpolujaca
yii = polyval(a,xi); % oblicz wartosci wielomianu "a" w punktach "xi"
a, % obliczone wsp. wielomianu: aN,...,a1,a0
figure; plot(x,y,'ro',xi,yi,'k',xi,yii,'b-'); title('y=f(x)'); % rysunek
fprintf('Wartość temperatury o 7:15 to %.2fC',polyval(a,7.25));

y_s = polyval(a,xi(1));
i=1;
while(y_s < 0)
    y_s = polyval(a,xi(i));
    i = i + 1;
end
x_s = xi(i),