% num2bitstr( single( (1+1/4)*2^(-124) ));
% num2bitstr( single( -5.877472*10^(-38) ));

c = 299792458;
% 0_10011011_00011101111001111000010
c_s = num2bitstr(single(c));
c_d = num2bitstr(c);

s_s = (c_s(1) - '0');
s_d = (c_d(1) - '0');

E_s = 0; E_d = 0;
K_s = 8; K_d = 11;

% E dla double
for i = K_d-1:-1:0
    e_d = c_d(K_d-i+1) - '0';
    E_d = E_d + (e_d*(2^(i)));
end

% E dla single
for i = K_s-1:-1:0
    e_s = c_s(K_s-i+1) - '0';
    E_s = E_s + (e_s*(2^(i)));
end

E_s = E_s - (2^(K_s-1)-1);
E_d = E_d - (2^(K_d-1)-1);

L_s = 23; L_d = 52;
F_s = 0; F_d = 0;

% petla dla double
for i = K_d+1:1:L_s
    f_d = c_d(i) - '0';
    F_d = F_d + (f_d*(2^(-i)));
end

% petla dla single
for i = K_s+1:1:L_s
    f_s = c_s(i) - '0';
    F_s = F_s + (f_s*(2^(-i)));
end

F_s = F_s+1; F_d = F_d + 1;

wartosc_single = ((-1)^s_s)*F_s*(2^E_s),
wartosc_double = ((-1)^s_d)*F_d*(2^E_d),