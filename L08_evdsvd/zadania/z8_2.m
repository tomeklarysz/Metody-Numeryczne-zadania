% evd_elipsa.m
clear all;

N = 1000;
% Elipsa - symetryczna macierz kowariancji elipsy
S = [ 1   0; ...                 % do zmiany 
      0   1 ];                   %

% 3. zmniejszenie na przekątnej - mniejsza szerokość, mniejsza
% 2. zmniejszenie na pozostałych - mniejsze nachylenie, ogólnie większa elips
% 4. zwiększenie na pozostałych - węższa, bardziej nachylona
% 5. zwiększenie na przekątnej - większa

% x = elipsa(S,1,N); 
r = 1;
[V,D] = eig(S);                    % EVD
wyznacznik = det(V);
V_wl = V;
V_kat = [acos(V_wl(1,1)),asin(V_wl(1,2));
    -asin(V_wl(2,1)), acos(V_wl(2,2))];

% [pi - fi,  fi
%  -fi,      fi]

V = V*sqrt(r*D);                   % macierz transformacji y (okrag) --> x (elipsa)
alfa = linspace(0,2*pi,N);         % katy okregu
x = V * [ cos(alfa); sin(alfa)];   % transformacja punktow okregu na elipse
figure; plot(x(1,:),x(2,:), 'ro'); grid; hold on;
x = x .* (2*(rand(1,N)-0.5));
%x = x .* (0.33*(randn(1,N)));
plot(x(1,:),x(2,:), 'b*'); grid; 
xlabel('x'); ylabel('y'); title('Circle/Ellipse'); grid; axis square

function x = elipsa(S,r,N)
[V,D] = eig(S);                    % EVD
V = V*sqrt(r*D);                   % macierz transformacji y (okrag) --> x (elipsa)
alfa = linspace(0,2*pi,N);         % katy okregu
x = V * [ cos(alfa); sin(alfa)];   % transformacja punktow okregu na elipse
end