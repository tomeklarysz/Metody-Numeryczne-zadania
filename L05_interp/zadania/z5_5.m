% interp_lagrange.m
clear all; close all;
x = [5, 6, 8, 11]; y = [-2, 3, 7, 10]; % zadane punkty = wezly
xi = 5: 0.05 : 12; % gdzie obliczyc nowe wartosci funkcji

[yi,a] = funTZ_lagrange(x,y,xi); % nasza funkcja interpolujaca
% yii = polyval(a,xi); % oblicz wartosci wielomianu "a" w punktach "xi"
a; % obliczone wsp. wielomianu: aN,...,a1,a0
figure; plot(x,y,'ro',xi,yi,'k'); 
xlabel('czas'); ylabel('temperatura'); title('y=f(x)'); hold on; % rysunek
for i = 1:length(xi)
    if xi(i) == 7.25
        fprintf('Wartość temperatury o 7:15 to %.2fC\n',yi(i));
        plot(xi(i),yi(i),'bo');
        break;
    end
end

y_t = -2:0.25:11;
[x_p,g] = funTZ_lagrange(y,x,y_t);
figure; plot(x_p,y_t,'k'); 
xlabel('czas'); ylabel('temperatura'); title('y=f(x)'); hold on;
for i = 1:length(y_t)
    if y_t(i) == 1
        godzina = floor(x_p(i));
        minuty = floor((x_p(i) - godzina) * 60);
        fprintf('Temperatura przekroczyła 1C o godzinie %d:%d\n',godzina,minuty);
        plot(x_p(i),y_t(i),'bo');
        break;
    end
end 

% dostarczenie świeżego pomiaru o 14
x = [5, 6, 8, 11, 14];
y = [-2, 3, 7, 10, 14];
xi = 5: 0.05 : 15;
[yi,a] = funTZ_lagrange(x,y,xi);
figure; plot(x,y,'ro',xi,yi,'k');
xlabel('czas'); ylabel('temperatura'); title('y=f(x)');