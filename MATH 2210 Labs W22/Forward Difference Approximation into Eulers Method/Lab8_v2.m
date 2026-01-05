%% LAB 8
% Design a script that calculates the forward difference approximation
% scheme for a particular function at a particular point. Use a starting
% step size of h=1 and halve it with every pass of the loop. Create a
% vector of estimates and associated error, stopping only when relative
% error is < 0.1 percent

clear all

format long

syms x;
syms f(x) g(x);

% Initialize some function that we will be working with
f(x) = log(x^10 + sin(x^3));

% Choose a point for which we want to estimate the derivative
a = 1.5;

% Find the true value of the derivative (bc it asks for relative error)
g(x) = diff(f);
trueval = double(g(a));

% Set our initial step size
h=1;

% Perform the 1st iteration of FDA to initialize the error
FDA(1) = double((f(a+h) - f(a))/h);
err(1) = abs((trueval - FDA(1))/trueval);

% Initialize counter for our while loop
i=1;

% START W A FOR LOOP

while err(i) >= 0.001
    % halve the step size
    h=h/2;
    
    % update our counter
    i=i+1;
    
    % Perform FDA
    FDA(i) = double((f(a+h)-f(a))/h);
    
    % Compute associated error
    err(i)= abs((trueval - FDA(i))/trueval);
end

FDA
100*err
h

% Plot it!

% Plot actual function
fplot(f)
hold on
% Plot tangent line using tangent line formula
y(x) = FDA(i)*(x-a) + f(a)
fplot(y)

%% PART 2
%Program a simple Euler's Method algorithm to solve an initial value 
%problem y' = 2ysin(t) with initial condition y(0) = 4.5 numerically.  Use
%a stepsize of h = 1.

clear all

syms t y;
syms f(t,y);

% Define the RHS of our differential equation
f(t,y) = y^2

% Set our inital values for t and our estimate of the function y
time(1) = 0;
est(1) = -2;

% Set our step size
h=0.05;

% Perform Euler's method!
for i=1:100
    time(i+1) = time(i) + h;
    est(i+1) = est(i) + h*f(time(i), est(i));
end

time 
est

syms true(t)
true(t)=0

% Plot
plot(time, est)
hold on
fplot(true, [time(1),time(length(time))])






