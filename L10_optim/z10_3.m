% funkcja "bananowa" Rosenbrocka i jej pochodne

fun = @(x)(100*(x(2) - x(1)^2)^2 + (1 - x(1))^2);     % funkcja bananowa
x0 = [-1.9,2];                                        % argumenty je minimum

grad = @(x)[-400*(x(2) - x(1)^2)*x(1) - 2*(1 - x(1)); % # jej gradient
             200*(x(2) - x(1)^2)];                    % #
fungrad = @(x)deal(fun(x),grad(x));                   % fun + grad 

hess = @(x)[1200*x(1)^2 - 400*x(2) + 2, -400*x(1);    % # jej hesjan
                             -400*x(1),      200];    % #
fungradhess = @(x)deal(fun(x),grad(x),hess(x));       % fun + grad + hes                         

vfun = @(x)[10*(x(2)-x(1)^2), 1-x(1)]; % f1(x1,x2) = 10*(x2 - x1^2), f2(x1,x2)=1-x1
jac = @(x)[-20*x(1),10;                % banan = f(x1,x2) = f1^2 + f2^2; 
                -1,  0];               % jacobian [f1; f2]
vfunjac = @(x)deal(vfun(x),jac(x));

% Przykład szukania minimum z użyciem tylko rownania funkcji i metody SIMPLEX
figure;
options = optimset('OutputFcn',@bananaout,'Display','off');
[x,fval,eflag,output] = fminsearch(fun,x0,options);
title('Rosenbrock solution via fminsearch() Simplex');
Fcount = output.funcCount;
disp(['Number of function evaluations for fminsearch (Simplex) was ',num2str(Fcount)]);
disp(['Number of solver iterations for fminsearch (Simplex) was ',num2str(output.iterations)]);
pause;

options = optimoptions('fminunc','Display','off',...
    'OutputFcn',@bananaout);
options = optimoptions(options,'SpecifyObjectiveGradient',true,...
    'Algorithm','trust-region');
[x,fval,eflag,output] = fminunc(fungrad,x0,options);
title('Rosenbrock solution via fminunc() Analytic Gradient');
Fcount = output.funcCount;
disp(['Number of function evaluations for fminunc() Analytic Gradient was ',...
    num2str(Fcount)]);
disp(['Number of solver iterations for fminunc() with Analytic Gradient was ',...
    num2str(output.iterations)]);
pause;

options.HessianFcn = 'objective';
[x,fval,eflag,output] = fminunc(fungradhess,x0,options);
title('Rosenbrock solution via fminunc() Analytic Gradient & Hessian');
Fcount = output.funcCount;
disp(['Number of function evaluations for fminunc() Analytic Gradient & Hessian was ',...
    num2str(Fcount)]);
disp(['Number of solver iterations for fminunc() Analytic Gradient & Hessian was ',num2str(output.iterations)]);
pause;

% Himmelblau's function
% https://en.wikipedia.org/wiki/Himmelblau%27s_function
% f(x,y)=(x^2+y-11)^2 + (x+y^2-7)^2

fun = @(x)((x(1)^2 + x(2) - 11)^2 + (x(1) + x(2)^2 - 7)^2);
% x0 = [5,5];
x0 = [-5,5];

grad = @(x)[4*x(1)*(x(1)^2 + x(2) - 11) + 2*(x(1) + x(2)^2 - 7);
    2*(x(1)^2 + x(2) - 11) + 4*x(2)*(x(1) + x(2)^2 - 7)];
fungrad = @(x)deal(fun(x),grad(x));

hess = @(x)[4*(x(1)^2 + x(2) - 11) + 8*x(1)^2 + 2, 4*x(1) + 4*x(2);
    4*x(1) + 4*x(2), 4*(x(1) + x(2)^2 - 7) + 8*x(2)^2 + 2];
fungradhess = @(x)deal(fun(x),grad(x),hess(x));


options = optimset('OutputFcn',@himmelblout,'Display','off');
[x,fval,eflag,output] = fminsearch(fun,x0,options);
title('Himmelblau solution via fminsearch() Simplex');
Fcount = output.funcCount;
disp(['Number of function evaluations for fminsearch (Simplex) was ',num2str(Fcount)]);
disp(['Number of solver iterations for fminsearch (Simplex) was ',num2str(output.iterations)]);
pause;

options = optimoptions('fminunc','Display','off',...
    'OutputFcn',@himmelblout);
options = optimoptions(options,'SpecifyObjectiveGradient',true,...
    'Algorithm','trust-region');
[x,fval,eflag,output] = fminunc(fungrad,x0,options);
title('Himmelblau solution via fminunc() Analytic Gradient');
Fcount = output.funcCount;
disp(['Number of function evaluations for fminunc() Analytic Gradient was ',...
    num2str(Fcount)]);
disp(['Number of solver iterations for fminunc() with Analytic Gradient was ',...
    num2str(output.iterations)]);
pause;

options.HessianFcn = 'objective';
[x,fval,eflag,output] = fminunc(fungradhess,x0,options);
title('Himmelblau solution via fminunc() Analytic Gradient & Hessian');
Fcount = output.funcCount;
disp(['Number of function evaluations for fminunc() Analytic Gradient & Hessian was ',...
    num2str(Fcount)]);
disp(['Number of solver iterations for fminunc() Analytic Gradient & Hessian was ',num2str(output.iterations)]);