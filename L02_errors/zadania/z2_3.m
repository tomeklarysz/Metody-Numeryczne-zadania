% a=fi( 11.25,0,8,4), a.bin,
% b=fi( 4.75,0,8,4), b.bin,
% c=fi( 4.75,1,8,4), c.bin,
% d=fi(-4.75,1,8,4), d.bin,

f = fi(pi,0,8,6), f.bin, % 11001001
% 2^1 + 2^0 + 2^-3 + 2^-6 = 3.1406
err_f = pi - double(f);

g = fi(pi,0,16,12), g.bin, % 0011001001000100
% 3.1416
err_g = pi - double(g);

h = fi(pi,1,8,6), h.bin,   % 01111111
% 1.9844
err_h = pi - double(h);

k = fi(pi,1,16,12), k.bin, % 0011001001000100
% 3.1416
err_k = pi - double(k);