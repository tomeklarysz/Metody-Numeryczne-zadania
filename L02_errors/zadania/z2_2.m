clear all;
a=fi( 1.625,0,8,7); a.bin;
b=fi( 0.375,0,8,7); b.bin;
c=fi( 0.375,1,8,7); c.bin;
d=fi(-0.375,1,8,7); d.bin;

format long,
% pi_val = pi
pi_frac = pi - floor(pi),

e = fi( pi_frac,0,8,7), e.bin,   % 00010010
% 2^-6 + 2^-3 = 9/64,

f = fi(-pi_frac,1,8,7), f.bin,   % 11101110
% -1 + 0.5 + 0.25 + 0.0625 + 0.03125 + 0.015625

g = fi( pi_frac,0,16,15), g.bin, % 0001001000100000

h = fi(-pi_frac,1,16,15), h.bin, % 1110110111100000


fprintf("error1: %.16f\n",abs(pi_frac-double(e)));
fprintf("error2: %.16f\n",abs(-pi_frac-double(f)));
fprintf("error3: %.16f\n",abs(pi_frac-double(g)));
fprintf("error4: %.16f\n",abs(-pi_frac-double(h)));