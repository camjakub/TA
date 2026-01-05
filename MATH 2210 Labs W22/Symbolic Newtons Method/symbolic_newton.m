%% SYMBOLIC NEWTON'S METHOD

syms x;
f(x) = exp(-x) - x;

d(x) = diff(f(x));

syms xold;
xold = -f(0)/d(0) + 0


% try changing this to run for 10 iterations... it pretty much breaks
% matlab
for i = 1:5
    xnew = - f(xold)/d(xold) + xold
    xold = double(xnew)
end 

double(xnew)