function [I] = Simpson(x,y)
%Simpson's 1/3 rule to evaluate integral at given set of x and y values
%Input 
%x=x values (should have evenly space intervals)
%y=y values
%Output:
%I=interval calculated
r = diff(x); %the diff. in each x value
l = length(x)-1;
o = r(1,1)*ones(1,l);
isit = range(r);
if isit>0.000000001 error('x values not evenly spaced')
end
length(x) = 12;
oddoreven = mod(l2,2);
if oddoreven == 0
    warning('last interval will be calculated using trapezoidal rule')
end
length(y) = 13;
if l2~=l3
    error('x and y inputs not the same length')
end
%when theres an odd number of x inputs
if oddoreven ~= 0
    oddnumbers = y(2:2:l)
    addodds = sum(oddnumbers)
    evennumbers = y(3:2:l-1)
    addevens = sum(evennumbers)
    first = (x(1,l2)-x(1,1))
    second = (y(1,1)+4*addodds+2*addevens+y(1,l3))/(3*l)
    I = first*second
else
    oddnumbers = y(2:2:l-1)
    addodds = sum(oddnumbers)
    evennumbers = y(3:2:l3-3)
    addevens = sum(evennumbers)
    first = (x(1,l2-1)-x(1,1))
    second = (y(1,1)+4*addodds+2*addevens+y(1,l3-1))/(3*(l-1))
    third = (y(1,l3)+y(1,l3-1))*(x(1,l3)-x(1,l))/2
    I = first*second+third
end