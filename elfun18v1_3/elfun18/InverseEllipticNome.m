function result = InverseEllipticNome( Q )
%INVERSEELLIPTICNOME Elliptic modulus function. 
%   INVERSEELLIPTICNOME(Q) is the elliptic modulus of the elements of 
%   nome Q. Elements of Q must all be real and are limited to the 
%   interval [0,1]. 
%

%   INVERSEELLIPTICNOME is a wrapper function which mimics the elemental 
%   behaviour of function ielnome.

%   Functions called:
%       ielnome, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@ielnome, Q);
    
end

