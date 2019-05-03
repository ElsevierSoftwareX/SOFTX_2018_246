function result = EllipticModulus( Q )
%ELLIPTICMODULUS Elliptic modulus function. 
%   ELLIPTICNOME(Q) is the elliptic modulus of the elements of 
%   nome Q. Elements of Q must all be real and are limited to the 
%   interval [0,1]. 
%

%   ELLIPTICMODULUS is a wrapper function which mimics the elemental 
%   behaviour of function elmodulus.

%   Functions called:
%       elmodulus, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@elmodulus, Q);
    
end

