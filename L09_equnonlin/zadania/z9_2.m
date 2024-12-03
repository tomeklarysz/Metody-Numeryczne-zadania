% equnonlin_solve.m
clear all; close all;

it = 12;
a  = pi-pi/5; b=pi+pi/5;
% znajdz zero funkcji y=sin(x) dla x=pi
f  = @(x) sin(x);         % definicja funkcji
fp = @(x) cos(x);         % definicja pochodnej funkcji

x = 0 : 0.01 : 2*pi;
% figure; plot( x, f(x), 'b-', x, fp(x),'r-'); grid; xlabel('x'); title('f(x), fp(x)');
% legend('Funkcja','Jej pochodna'); pause

[cb,odl] = nonlinsolvers( f, fp, a, b, 'bisection', it );
% figure; plot( 1:it,cb,'o-'); xlabel('iter'); title('c(iter)')

blad = abs(pi - cb(it));
ek = (b-a)/(2^(it));

fprintf("blad: %.6f ~ %.6f procentowy blad\n",blad,(blad*100)/pi);
% fprintf("zbieznosc liniowa: %.6f\n",ek)

a  = pi-pi/5; b=pi+pi/5;
[cd,k] = nonlinsolversWhile(f, fp, a, b);
fprintf("blad: %.6f\n",abs(pi - cd));
% fprintf("zbieznosc liniowa: %.6f\n",(b-a)/(2^(k)))

% druga czesc
% /////////////


% 10 stopni
fk = @(x) x.^2 + 0.176*x;
fkp = @(x) 2*x + 0.176;
stp = @(x) 0.176*x;

% 45 stopni
fc = @(x) x.^2 + x;
fcp = @(x) 2*x + 1;
stc = @(x) x;
a = 0; b = 4;
x = -5:0.01:5;
figure;
plot( x, fc(x), 'b-', x, stc(x),'r-',x, fk(x), 'm-', x, stp(x),'g-'); grid; xlabel('x'); title('f(x), fp(x)');
[p1, k1] = nonlinsolversWhile(fk,fkp,a,b);

function [C,odl] = nonlinsolvers(f, fp, a, b, solver, iter)
C = zeros(1,iter);    % kolejne oszacowania miejsca zerowego 
c = a;                % pierwsze oszacowanie
odl = zeros(1,iter);
for i = 1 : iter
  fa = feval(f,a); fb=feval(f,b); fc=feval(f,c); fpc=feval(fp,c);  % oblicz
  switch(solver)
    case 'bisection',
        if( fa*fc<0 ) b=c; else a=c; end
        c = (a+b)/2;
        odl(i) = abs(a-b);
    case 'regula-falsi',
        if( fa*fc<0 ) b=c; else a=c; end
        c = b-fb*(b-a)/(fb-fa);
    case 'newton-raphson',
        c = c-fc/fpc;
  otherwise,
      error('Brak metody');
  end
  C(i)=c;  % zapamietaj
end
end

% bez podania liczby iteracji, blad = 0.001%
function [zk,it] = nonlinsolversWhile(f, fp, a, b)
it = 1;
zk = 0;
dok = 0.00001;
min = pi * dok;
fprintf("0.00001 * pi = %.10f\n",min);
c = a;

while ((b-a)/2 > min)
  fa = feval(f,a); fb=feval(f,b); fc=feval(f,c); fpc=feval(fp,c);  % oblicz
  if( fa*fc<0 ) b=c; else a=c; end
  c = (a+b)/2;
  zk = c;
  it = it + 1;
end
end