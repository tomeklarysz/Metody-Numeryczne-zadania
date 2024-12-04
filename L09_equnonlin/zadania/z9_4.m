clear all; close all;

it = 12;
a  = pi-pi/5; b=pi+pi/5;
% znajdz zero funkcji y=sin(x) dla x=pi
f  = @(x) sin(x);         % definicja funkcji
fp = @(x) cos(x);         % definicja pochodnej funkcji

x = 0 : 0.01 : 2*pi;
% figure; plot( x, f(x), 'b-', x, fp(x),'r-'); grid; xlabel('x'); title('f(x), fp(x)');
% legend('Funkcja','Jej pochodna'); pause

cr = mynonlinsolvers( f, fp, a, b, 'sieczne', it );
% figure; plot( 1:it,cr,'o-'); xlabel('iter'); title('c(iter)');

blad = abs(pi - cr(it));
fprintf("blad: %.6f\n",blad);

a  = pi-pi/5; b=pi+pi/5;
[cd,k] = nonlinsolversWhile(f, fp, a, b, pi);
fprintf("wyznaczone miejsce zerowe: %.6f\n",cd);
fprintf("blad: %.7f - %.7f = %.6f\n",cd,pi,abs(pi - cd));
fprintf("liczba iteracji aby dokladnosc byla 0.001%%: %d\n",k);

% druga czesc
% /////////////

x0 = 2;

% 45 stopni
kat = 45;
% f(x) = ax^2 + (1-4a)x + (4a-2)
a1 = 4;
fc = @(x) a1*x.^2 + (1-4*a1)*x + 4*a1 - 2;
fcp = @(x) 2*a1*x - 4*a + 1;
stc = @(x) tan(kat)*(x-x0) + fc(x0);

% 10 stopni
kat = 10;
fk = @(x) a1*x.^2 + (tan(kat) - 4*a1)*x + 4*a1 - 2 * tan(kat);
fkp = @(x) 2*a1*x - 4*a1 + tan(kat);
stp = @(x) tan(10)*(x-x0) + fc(x0);

% 80 stopni
kat = 80;
fs = @(x) 4*x.^2 +10.33*x - 36.66;
fsp = @(x) 8*x + 10.33;

a = 1.9; b = 2.4;
x = 1:0.01:4;

figure;
plot( x, fc(x), 'b-',x,stc(x),'r-',x0,0,'bo'); grid; xlabel('x'); title('f(x), styczna w x0 = 2 kąt 45');
figure;
plot(x, fk(x), 'b-',x,stp(x),'r-',x0,0,'bo'); grid; xlabel('x'); title('f(x), styczna w x0 = 2 kąt 10');
figure;
plot(x, fs(x), 'b-',x0,0,'bo'); grid; xlabel('x'); title('f(x), x0 = 2 kąt 80');

[p1, k1] = nonlinsolversWhile(fc,fcp,a,b,x0);
fprintf("45 stopni: wynik: %.6f, liczba iteracji: %d\n",p1,k1);
[p2, k2] = nonlinsolversWhile(fk,fkp,a,b,x0);
fprintf("10 stopni wynik = %.6f : liczba iteracji: %d\n",p2,k2);
[p3, k3] = nonlinsolversWhile(fs,fsp,a,b,x0);
fprintf("80 stopni wynik = %.6f : liczba iteracji: %d\n",p3,k3);
% figure; plot( 1:28,p2,'o-'); xlabel('iter'); title('c(iter)')


% bez podania liczby iteracji, blad = 0.001%
function [zk,it] = nonlinsolversWhile(f, fp, a, b, sol)
it = 1;
zk = 0;
dok = 0.00001;
min = sol * dok;
c = a;
while (abs(sol - zk) > min)
  fa = feval(f,a); fb=feval(f,b); fc=feval(f,c); fpc=feval(fp,c);  % oblicz
  if( fa*fc<0 ) b=c; else a=c; end
  c = b - (fb*(b-a))/(fb-fa);
  if abs(c-a) < abs(c-b) a = c; else b = c; end
  zk = c;
  if (abs(sol - zk)) <= min && it ~= 1
      break
  else
      it = it + 1;
  end
end
end

function C = mynonlinsolvers(f, fp, a, b, solver, iter)

C = zeros(1,iter);    % kolejne oszacowania miejsca zerowego 
c = a;                % pierwsze oszacowanie

for i = 1 : iter
  fa = feval(f,a); fb=feval(f,b); fc=feval(f,c); fpc=feval(fp,c);  % oblicz
  switch(solver)
    case 'bisection',
        if( fa*fc<0 ) b=c; else a=c; end
        c = (a+b)/2;
    case 'regula-falsi',
        if( fa*fc<0 ) b=c; else a=c; end
        c = b-fb*(b-a)/(fb-fa);
    case 'newton-raphson',
        c = c-fc/fpc;
    case 'sieczne',
        c = b - (fb*(b-a))/(fb-fa);
        if abs(c-a) < abs(c-b) a = c; else b = c; end
  otherwise,
      error('Brak metody');
  end
  C(i)=c;  % zapamietaj
end
end
