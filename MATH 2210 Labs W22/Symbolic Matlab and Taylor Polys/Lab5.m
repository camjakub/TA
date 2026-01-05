%% LAB 5?
% symbolic matlab

%% Basics

% Declare a symbolic variable x
syms x;
syms f(x); % optional

% Define a function of x
f(x) = cos(x) + 2*x

% Use the function!
f(2)

f(pi) % this uses the symbol pi, which has no error!

% If we were to not use symbolic, let's see what would happen
cos(pi) + 2*pi
% spits out a number!

f(y) % returns an error until we define what y is!
     % try definining y as a symbol, and then a number
     
%% Combining functions

g(x) = exp(x) - 1/x;

h(x) = f(x) + g(x);

h(x) = f(g(x));

% this is good, but how do we use the VALUE of each function?
% use the double function!

h(1);
double(h(1));

%% Differentiation and integration
clear all

syms x;
f(x) = x^3;

diff(f(x));

% Higher order derivatives
diff(diff(f(x)));
diff(f(x), 2);

int(f(x));

g(x) = diff(f(x));


% functions of 2 variables 
syms y;
t(x,y) = sin(x) + cos(y)

% partial derivatives
diff(t(x,y), y)

% Do not assign a value to a symbolic variable!
% it is no longer symbolic, and will not be treated as such!

% Using normal variables, MATLAB will always spit out numbers. 
% With symbolic matlab, it will always treat them as expressions, which
% allows for exact answers, rather than approximations

% this can cause issues sometimes too, though!

%% Newton's method example

%% Constructing a Taylor polynomial

% Define symbolic variable
syms x

% Define the function we wish to use
f(x) = sin(x);

% Define value we want our series to be centred around 
a = 0;

% Create a symbolic function for the Taylor series, and initialize it to
% the first term in the series
TaylorPol(x) = f(a);

for n = 1:4
     f(x) = diff(f(x));
     TaylorPol(x) = TaylorPol(x) + f(a)/factorial(n)*(x-a)^n;
end

TaylorPol(x)


% Plot the results!!
xrange = -pi:0.05:pi;

% Get the y values of the sin function
yfun = sin(xrange);

% plot sin function
plot(xrange, yfun)
hold on

% Get y values of taylor series
ytaylor = TaylorPol(xrange);

plot(xrange, ytaylor);
ylim([-1.2, 1.2])



