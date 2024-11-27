clear all;
A = [   3 0 1 0; 
        0 -2 0 1;
        1 0 2 0;
        0 1 0 2];
[N, N] = size(A);
for i = 1:N
    [val,index] = max(abs(A),[],"all");
end
val,
index,