clear all 

syms t y

%Program a simple Euler's Method algorithm to solve an initial value 
%problem y' = 2ysin(t) with initial condition y(0) = 4.5 numerically.  Use
%a stepsize of h = 1.

RHS(t,y)=2*y*sin(t)

%initial t and y values
time(1) = 0;
est(1) = 4.5;

%stepsize 
h = 1;

for i = 1:5
  est(i+1)=est(i)+h*RHS(time(i),est(i));
  time(i+1)=time(i)+h;
end 

time
est
