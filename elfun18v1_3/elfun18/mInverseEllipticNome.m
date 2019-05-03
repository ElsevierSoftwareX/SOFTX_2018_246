function result = mInverseEllipticNome( Q )
%MINVERSEELLIPTICNOME Ellipticparameter function. 
%   MINVERSEELLIPTICNOME(Q) is the elliptic parameter of the elements of 
%   nome Q. Elements of Q must all be real and are limited to the 
%   interval [0,1]. 
%

%   MINVERSEELLIPTICNOME is a wrapper function which mimics the elemental 
%   behaviour of function mielnome.

%   Functions called:
%       mielnome, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@mielnome, Q);
    
end

