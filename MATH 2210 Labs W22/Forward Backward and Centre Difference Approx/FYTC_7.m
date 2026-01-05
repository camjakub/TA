%% FTYC 7
% Define function f
syms x;
syms f(x);
f(x) = 2*(x^2+2*sin(x));

% Set point that we want to approximate derivative
a = 4.5;

% Set step size
h=0.1;

% FDA
fda = double((f(a+h) - f(a))/h)

% BDA 
bda = double((f(a) - f(a-h))/h)

% CDA
cda = double((f(a+h) - f(a-h))/(2*h))

% Plot actual function
fplot(f, [3.2,5])
hold on
% Plot tangent line using tangent line formula
y(x) = fda*(x-a) + f(a);
fplot(y, [3.2,5])

% Finding second derivative
second_deriv = double((f(a+h) + f(a-h) -2*f(a))/(h^2));

%% 



