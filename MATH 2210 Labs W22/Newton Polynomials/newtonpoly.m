%% NEWTON POLYNOMIAL

clear all;

% Initialize points we wish to interpolate
p = [1 2 4 7];
q = [0 2 -2 -1];

% Extract number of points we are interpolating
numpoints = length(p);

% We initialize our y values on the diagonal of the divided difference matrix
for i=1:numpoints
    DD(i,i) = q(i);
end

numDDs = numpoints-1;

% The divided differences are then constructed on the diagonals above
% the previous
%
% | y1   DD1  DD2  DD3 |
% |                    |
% | 0    y2   DD1  DD2 |
% |                    |
% | 0    0    y3   DD1 |
% |                    |
% | 0    0    0    y4  |
 
for i = 1:numpoints-1 % Defines the column we are in
    for j = 1:numDDs  % Defines the row we are in 
        
        % Compute the divided difference
        DD(j,j+1) = ( DD(j+1, j+i) - DD(j,j+i-1) )/( p(j+i)-p(j) );
        
    end
    
    % update the number of DDs needed to calculate next iteration
    numDDs = numDDs-1;
    
end

% Initialize necessary variables and functions
syms x;
syms f(x);
syms newprod(x);
newprod(x) = 1;
f(x) = DD(1,1);

% Construct Newton Polynomial
% f(x) = a1 + a2(x-x1) + a3(x-x1)(x-x2) + a4(x-x1)(x-x2)(x-x3) + ...
for i = 2:numpoints
    newprod(x) = newprod(x)*(x-p(i-1));
    f(x) = f(x) + DD(1,i)*newprod(x);
end

% Plot everything
fplot(f, [0,10])
hold on

for i=1:length(p)
    plot(p(i),q(i), 'r*')
end

hold off