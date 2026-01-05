%% Lab - fplot and fixed points
% Office Hours
% MATT - Mondays 1pm
%      - Wednesdays 4pm
%
% ME   - Mondays 3pm

%% Last week plotting

xrange = -pi:0.05:pi;
yrange = sin(xrange);

plot(xrange, yrange)

%% New plots
syms x;
f(x) = sin(x^2);

%basic plot
%fplot(f)

% set the bounds of the x values
%fplot(f, [-2, 2])

% Plotting multiple functions
g(x) = 0.5*tan(x);

%fplot([f, g], [-1, 1])

% another way
fplot(f, [-2, 2])
hold on
fplot(g, [-2,2])

%% Customizing plots
fplot(f, [-2,2], '-.r', 'LineWidth', 2)

% line types
% '-' - default line
% '--' - dashed line
% ':' - dotted line
% '-.' - dash dot line

% colour specifiers
% r - red
% b - blue
% m - magenta
% g - green
hold on
fplot(g, [-2,2], 'b', 'LineWidth', 3)

plot(1, f(1), 'mo') 
% point specifiers
% 'o'

% set y limits
ylim([-0.8, 0.8])

% Add some axis labels
xlabel('My x variable')
ylabel('Y')
title('My plot')

% change font size
set(gca, 'fontsize', 14)

% add legend
legend('show', 'Location', 'best')

%% Fixed point iterations
% Create a loop which finds a fixed point of a function f by iterating
% until successive guesses are within 0.00001 of each other

clear all;

syms x;
f(x) = (5/2)*x - (3/2)*x^2;
g(x) = x;

fplot([f,g], [-3,4], 'LineWidth', 2)
ylim([-6,6])
grid on

a(1) = -1;
a(2) = f(a(1));

i=1;
while abs(a(i) - a(i+1)) >= 0.01
    i = i+1;
    a(i+1) = f(a(i));
end

%% Plot results
fplot([f,g], 'LineWidth', 2)
ylim([-6,6])
grid on

hold on

for i = 1:length(a)
    plot(a(i), f(a(i)), '*')
end





















