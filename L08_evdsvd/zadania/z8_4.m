clear all;
% A = [   3 1 2 3; 
%         1 -2 2 3;
%         2 2 2 4;
%         3 3 4 2];
A = [   3 1 2 3 4; 
        1 -2 2 3 2;
        2 2 2 4 1;
        3 3 4 2 5
        4 2 1 5 2];
[N, N] = size(A);

V = eye(N);
while (~isdiag(A))
    [x,p,q] = findmax(A);
    if x < 0.0001
        break;
    end
    xi = (A(q,q)-A(p,p)) / (2*A(p,q));
    if (xi > -eps) 
        t = abs(xi) + sqrt(1+xi^2);
    else 
        t = -abs(xi) + sqrt(1+xi^2);
    end
    c = 1 / sqrt(1+t^2);
    s = t * c;
    R1 = eye(N);
    R1(p,p) = c; R1(q,q) = c;
    R1(p,q) = -s; R1(q,p) = s;
    V = V * R1;
    A = R1.' * A * R1;
end

% sprawdzenie
% A_og = [ 3 1 2 3; 
%         1 -2 2 3;
%         2 2 2 4;
%         3 3 4 2];
A_og = [   3 1 2 3 4; 
        1 -2 2 3 2;
        2 2 2 4 1;
        3 3 4 2 5
        4 2 1 5 2];

[V1, D] = eig(A_og);

disp('wartosci wlasne (jacobi): ');
disp(diag(A));
disp('wartosci wlasne (matlab): ');
disp(diag(D));
disp('wektory wlasne (jacobi): ');
disp(V);
disp('wektory wlasne (matlab): ');
disp(V1);


function [x,p,q] = findmax(A)
[n,n] = size(A);
x = 0;
for i=1:n
    for j=1:n
        a = A(i,j);
        maks = max(abs(a));
        if (maks > x) && (i ~= j)
            x = maks;
            p = i;
            q = j;
        end
    end
end
end