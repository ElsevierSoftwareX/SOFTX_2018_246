function result = mInverseJacobiDN( X, M )
%MINVERSEJACOBIDN Inverse of the Jacobi function DN.
%   MINVERSEJACOBIDN(X,M) is the inverse of Jacobi function DN for the
%   elements of argument X and parameter M. X and M must all be real and  
%   the same size or any of them can be scalar. 
%
%   See also INVERSEJACOBIDN

%   MINVERSEJACOBIDN is a wrapper function which mimics the elemental 
%   behaviour of function MIJDN.

%   Functions called:
%       mijdn, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mijdn, X, M);
    
end

