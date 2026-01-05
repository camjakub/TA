%% FYTC - Fixed Points

% Define your function
syms x;
syms f(x);
f(x) = x/2;

% Define initial starting point
a = 22;

% Define your tolerance
tol = 0.000001;

% Initialize first iteration
a_new = double(f(a));

% Create your while loop
while abs(a-a_new) > tol
    dist1 = abs(a-a_new);
    
    % Perform an iteration
    a = a_new;
    a_new = double(f(a));
    
    dist2 = abs(a-a_new);
    
    % If somehow the distance has gotten larger, break the loop
    if (dist2 > dist1)
        break;
        disp("error")
    end
    
    if dist2 < 0.1
        break;
    end
end

% Now do Newton's method!
syms f_new(x) f_deriv(x)
f_new(x) = f(x) - x;
f_deriv = diff(f_new)

anew = double(-f_new(a)/f_deriv(a) + a)
err = abs(a-a_new)
a = anew

while err > tol
    anew = double(-f_new(a)/f_deriv(a) + a)
    err = abs(a-a_new)
    a = anew
    
    if f(a) == a
        break;
    end
end

a

% Calculate an estimate of the slope of the tangent
slope = (f(a) - f(a_new))/(a-a_new);



