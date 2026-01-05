%% Lab 11?
% Riemann Sum

clear all

format long

syms x;
syms f(x);

% Initialize function
f(x) = sqrt(x)*sin(x);

% Set our nodes
node = [0 1 2 3 4 5];

% Set interval width
h = 1;

% set area variable
area = 0;

% Left sum approximation
for i = 1:length(node)-1
    area = area + double(h*f(node(i)))
end

area

area=0;

% Right sum approximation
for i = 2:length(node)
    area = area + double(h*f(node(i)))
end

%% Better way!

clear all

format long

syms x;
syms f(x);

% Initialize function
f(x) = sqrt(x)*sin(x);

% Define start, end point and number of intervals
startx = 0;
endx = 5;
numintervals = 100;

h = (endx-startx)/numintervals;

% create node vector
node = startx:h:endx;

% set area variable
area = 0;

% Left sum approximation
for i = 1:length(node)-1
    area = area + double(h*f(node(i)));
end

area

area=0;

% Right sum approximation
for i = 2:length(node)
    area = area + double(h*f(node(i)));
end

area

%% Trapezoid Rule

clear all

format long

syms x;
syms f(x);

% Initialize function
f(x) = sqrt(x)*sin(x);

% Define start, end point and number of intervals
startx = 0;
endx = 5;
numintervals = 100;

h = (endx-startx)/numintervals;

% create node vector
node = startx:h:endx;

% initialize area
area_trap = 0;

for i = 2:length(node)-1
    area_trap = area_trap + double( h*f(node(i)) );
end

area_trap = area_trap + double( (1/2)*h*f(node(1)) + (1/2)*h*f(node(length(node))) );
area_trap

%% Simpson's rules

clear all

syms x;
syms f(x);

% Initialize function
f(x) = sqrt(x)*sin(x);

% Define start, end point and number of intervals
startx = 0;
endx = 5;
numintervals = 100;

h = (endx-startx)/numintervals;

% create node vector
node = startx:h:endx;

% initialize area
area_simp = 0;

for i = 2:length(node)-1
    
    if mod(i,2) == 0 % even node
        
        area_simp = area_simp + double( (4/3)*h*f(node(i)) );
    
    else % odd node
        
        area_simp = area_simp + double( (2/3)*h*f(node(i)) );
        
    end
end

area_simp = area_simp + double( (1/3)*h*f(node(1)) + (1/3)*h*f(node(length(node))) );
area_simp

%% Fun stuff

image

penny

xpbombs

load handel
sound(y,Fs)


[y,Fs]=webread('http://teachingtheoutsiders.com/sounds/voice_battlecry.wav');
% Create a 'player' object
PO=audioplayer(y,Fs);
% Play audio
play(PO)










