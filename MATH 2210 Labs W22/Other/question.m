xnew=2;
% xold=3; commented out this line because we no longer need xold variable
% the new error function only needs our most recent approximation, which
% we will call xnew

xstar=1.740598534197962; % Updated the value of xstar for this function!

error = abs(xnew - xstar)/xstar; % this is the error formula in my email
% Also, I moved the initial error calculation up here. We're 
% still going to calculate the error in the for loop. This is just the
% first calulation to initialize our error variable.

syms x;
format long;
f(x)=exp(x)+2^(-x)-6;
g(x)=diff(f);
guess(1)=2; % Here, I changed x(1) to guess(1).
% The reason I did this is because we have already defined x as a symbolic
% variable. So we don't want to use it again as a numeric variable!
% Instead, we are going to use the variable "guess" to store the various
% guesses of Newton's method. I updated this in the code below too.

for i=1:100
    
    if error<0.005
        display("Error is good")
        break;
    end
    
  % xold = guess(i) commented out this because we no longer need xold
  guess(i+1)=(double((-f(guess(i))/g(guess(i)))+guess(i)))
  xnew=guess(i+1);
  
  if(double(f(xnew)) == 0) % We don't actually want to check if xnew == 0, we want to check if
      display("Guess is completely correct!") % f(xnew) == 0! That is when our function                                            
       break;                                 % f is at a zero. So i changed this to f(xnew).
  end                                         % I also put the double command around it to make
                                              % sure it is interpreted as a
                                              % number, not a symbol

                                              
% Here is where we check the error of our calculation for each loop!                                               
error = abs(xnew - xstar)/xstar; % update the error

% Now we go back to the top of the loop, and check if the error is
% satisfied!
end

double(error)
display("Yup")
double(xnew)
i





