x = 10^(-50);
y = 10^200;
z = 10^300;

a = (x*y)/z, % raczej ok
b = x*(y/z),
c = (x/z)*y, % zle, bo dzielimy mala przez duza


% unikamy odejmowania liczb o zblizonych wartosciach,
% staramy sie dodawac liczby o zblizonych wartosciach,
% staramy sie, aby wyniki przejsciowe były bliskie jedynki, 
% np. mnozymy liczby małe i duze, dzielimy podobne,
% wielokrotne dodawanie rozpoczynamy od liczb najmniejszych