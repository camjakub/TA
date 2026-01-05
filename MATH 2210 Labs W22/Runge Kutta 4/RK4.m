% Code RK4

clear all;
clc;

format long;

% Declare variables and functions
syms t y;
syms f(t,y);

% Define RHS of differential equation
f(t,y) = 2*sqrt(t)*y+2; 

% Define our intial starting point
time(1) = 0;
est(1) = -1.5;

% Define step size
h = 0.125;

% Perform RK4
for i = 1:20
    k1 = h*f(time(i), est(i));
    k2 = h*f(time(i)+0.5*h, est(i) + 0.5*k1);
    k3 = h*f(time(i)+0.5*h, est(i) + 0.5*k2);
    k4 = h*f(time(i)+h, est(i) + k3);
    
    R = (k1)/6 + (k2)/3 + (k3)/3 + (k4)/4;
    
    % Update our estimate
    est(i+1) = est(i) + R;
    time(i+1) = time(i) + h;
    
end

plot(time, est)
