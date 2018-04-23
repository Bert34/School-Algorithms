function [root,fx,ea,iter] = falseposition(func,xl,xu,es,maxiter);
%inputs
%func-the function being evaluated
%xl-the lower guess
%xu-the upper guess
%es-dessired relative error
%maxiter- number of iteration desired
%output
%root-estimated root location
%fx- function evaluated at root
%ea- approximate relative error
%iter- how many iterations were performed
if func(xl)*func(xu)>0  %this is if guesses don't bracket a sign change
    error('no bracket') %this is the error message displayed
end
if nargin<5, maxit=200;end %this was the default requested
if nargin<4, es=.0001;end %the 0.0001 default requested
if nargin<3, error('3 inputs needed');end %if 3 inputs or more aren't entered error message appears
iter=0;
x=xl; %lower guess
while(1)
    xold=x; %old x value is new x value
    x=xu-func(xu)*(xl-xu)/(func(xl)-func(xu)); %x value is lower guess-func of upper guess* lower-upper/the func of lower-the func of upper
    iter=iter+1;
    if x~=0, ea = abs((x-xold)/x)*100;end %if x isnt 0 the relative error is the absolute value of x - old x/ x *100 to get it in %
    test = func(xl)*func(x);
    if test<0  
        xu=x; % if the test is less than 0 upper guess becomes x
    elseif test>0 
        xl=x; %otherwise the test has to be greater than and making lower guess the x 
    else
        ea=0; %if neither of the two then the relative error is 0
    end
    if ea<=es|iter>=maxit,break,end %if the relative error is less than or equal to the desired and iter is greater than or equal to max iterations desired then the loop stops
end
root=x,fx=func(x);





