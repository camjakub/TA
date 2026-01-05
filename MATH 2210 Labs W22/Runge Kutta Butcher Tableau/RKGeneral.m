clear all

syms t;
syms y;
syms f(t,y);
syms truesol(t); 

%The next line defines a Butcher Tableau as in the notes.
Butcher = [0 0 0; 1/2 1/2 0; 0 0 1];
numRKSteps = 2;  %Defines the number of steps in the Runge-Kutta scheme.
f(t,y) = 2*sqrt(t)*y+2;  %Defines the RHS of the DE.
%truesol(t)=exp(t)+(pi*exp(t)-pi*cos(pi*t)-sin(pi*t))/(pi^2 + 1);  %The true solution. 
current_t=0;  %Defines the initial value of t.
current_y=-2;  %Defines the initial value of y.
h = 0.125;  %Stepsize

for i = 1:40   %This loop will perform 2 iterations of the whole scheme.
   for j = 1:numRKSteps
      k(j) = 0; %Initializes all of the "k" values...as a vector!
   end
    
   for j = 1:numRKSteps
       yIncrement = 0;
       for n = 2:numRKSteps 
          %This loop builds the right terms to be added to the current y in each of the "k".
          yIncrement = yIncrement + Butcher(j,n)*k(n-1);  
       end
       %Now, we can define each of the "k" in the scheme using the result of that loop.
       k(j)=double(h*f(current_t + Butcher(j,1)*h,current_y+yIncrement)); 
   end
   R = 0; %Initializes the weighted average R so that we can calculate it fresh.
   for j = 1:numRKSteps
       %Calculates R by adding up the right combination of the k(j) that we found.
       R = R + Butcher(numRKSteps+1,j+1)*k(j);  
   end

   current_y = current_y + R;  %This is our new y estimate at the next t value.
   current_t = current_t + h;  %This updates our t value.
end

double(current_t)  %Displays the current t and y (our last estimate) at the end.
double(current_y)  
%abserror=double(abs(truesol(current_t)-current_y)) %Calculates errors in that last estimate.
%relerror=double(abserror/truesol(current_t)*100)