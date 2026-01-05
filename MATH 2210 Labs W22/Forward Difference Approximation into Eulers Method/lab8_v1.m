%% Lab8
% Design a script that calculates the forward difference approximation
% scheme for a particular function at a particular point. Use starting step
% size of h = 1 and halve it with every pass of the loop. Create a vector
% of estimates and associated error, stopping only when relative error is <
% 0.1 percent = 0.001

clear all

format long

syms x;
syms f(x) g(x);

% Initialize our function
f(x) = 0.1*x^3*sqrt(exp(-x)+1);

% Choose a point where we will approximate the derivative
a = -3;

% Calculate true value
g(x) = diff(f(x));
trueval = double(g(a));

% Set initial step size
h = 1;

% Define our initial error
FDA(1) = double((f(a+h) - f(a))/h);
err(1) = abs((trueval - FDA(1))/trueval);

% Define i
i=1

while err(i) >= 0.001
    % halve the step size
    h = h/2;
    
    % update the counter
    i = i+1;
    
    % Perform FDA
    FDA(i) = double((f(a+h) - f(a))/h);
    
    % update the error
    err(i) = abs((trueval - FDA(i))/trueval);

end

100*err;
h

% Plot the function
fplot(f)
hold on

% Plot the tangent line
y(x) = FDA(i)*(x-a)+f(a)
fplot(y)


%% PART 2
% Program a simple Euler's method algorithm to solve an IVP y' = 2ysin(t)
% with initial condition y(0) = 4.5.

% Use step size of h=1

clear all

syms t y;
syms f(t,y);

% Defind what f is (RHS of the equation)
f(t,y) = 2*y*sin(t)

% Set our intial values
time(1) = 0;
est(1) = 4.5;

% Set our step size
h = 0.02;

for i = 1:500
    time(i+1) = time(i) + h;
    est(i+1) = est(i) + h*f(time(i), est(i));
end

plot(time, est)

















