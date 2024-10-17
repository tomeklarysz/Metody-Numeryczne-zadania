clear all;
% a=fi( 11.25,0,8,4), a.bin,
% b=fi( 4.75,0,8,4), b.bin,
% c=fi( 4.75,1,8,4), c.bin,
% d=fi(-4.75,1,8,4), d.bin,

f = fi(pi,0,8,6), f.bin,     % 11001001
% 2^1 + 2^0 + 2^-3 + 2^-6 = 3.140625

g = fi(pi,1,8,6), g.bin,     % 01111111
% 1.984375

h = fi(pi,0,16,12), h.bin,   % 0011001001000100
% 3.1416015625

k = fi(pi,1,16,12), k.bin,   % 0011001001000100
% 3.141601562500000


fprintf("error1: %.16f\n",abs(pi-double(f)));
fprintf("error2: %.16f\n",abs(pi-double(g)));
fprintf("error3: %.16f\n",abs(pi-double(h)));
fprintf("error4: %.16f\n",abs(pi-double(k)));