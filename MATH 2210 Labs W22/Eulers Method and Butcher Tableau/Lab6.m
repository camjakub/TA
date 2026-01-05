clear all

%% Q1
syms u x ;
syms f(u, x);
syms g(u);
g(u)=2*exp(-3*u);

%Define the RHS of the DE
f(u,x)=-3*x

%Set our initial values for t and our estimate of the function y
time(1)=0;
est(1)=2;

%Set our step size
h=10;

%Perform Euler's method!
for i=1:5
    time(i+1)=time(i)+h;
    est(i+1)=est(i)+h*f(time(i), est(i));
end

time
est

syms true(t)
true(t)=0

%Plot
fplot(g(t))
hold on
plot(time, est)
%fplot(true, [time(1),time(length(time))])

%% Q2
syms t;
syms y;
syms f(t,y);
syms truesol(t);

%The next line defines a Butcher Tableayu as in the notes- MARCH 14 NOTES
Butcher=[0 0 0 0 0; 1/3 1/3 0 0 0; 2/3 -1/3 1 0 0; 1 1 -1 1 0; 0 1/8 3/8 3/8 1/8];
numRKSteps=4;
f(t,y)=t*sin(t*y); %Defines the RHS of the DE
current_t=0; %initial t
current_y=1.130552; %initial y %STUDENT NUMBER IS 1130552
h=0.5; %Stepsize

for i=1:20 %This loop will perform 2 iterations of the whole scheme
    for j=1:numRKSteps
        k(j)=0;
    end
    
    for j=1:numRKSteps
        yIncrement=0;
        for n=2:numRKSteps
            %This loop builds the right terms to be added to the current y
            %in each of the "k"
            yIncrement=yIncrement+Butcher(j,n)*k(n-1);
        end
        %Now, we can define each of the "k" in the scheme using the result
        %of that loop
        k(j)=double(h*f(current_t+Butcher(j,1)*h,current_y+yIncrement));
    end
    
    R=0; %Initializes the weighted average R so that we can calculate it fresh
    
    for j=1:numRKSteps
        %Calculates R by adding up the right combination of the k(j) that
        %we found
        R=R+Butcher(numRKSteps+1,j+1)*k(j);
    end
    
   current_y = current_y + R;
   current_t = current_t + h;
   end
 
   double(current_t)
   disp("The final estimate for the value of y is:")
   double(current_y)

