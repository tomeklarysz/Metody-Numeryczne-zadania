f1 = @(x) sqrt(x)*(sqrt(x+1) - sqrt(x));
f2 = @(x) sqrt(x)/(sqrt(x+1) + sqrt(x));
% x = 10.^(0:10);
format long e
for i = 0:15
    x = 10^i;
    fprintf("At x= %16d, f1(x)=%.18f, f2(x)=%.18f\n",x,f1(x),f2(x));
    if i>13
        sx = sqrt(x+1);
        s = sqrt(x);
        sum = sx+s;
        diff = sx-s;
        fprintf("\t\t sqrt(x+1)= %25.13f, \n\t\t   sqrt(x)= %25.13f\n",sx,s);
        fprintf("\t\t      diff= %25.13f, \n\t\t       sum= %25.13f\n",diff,sum);
    end
end