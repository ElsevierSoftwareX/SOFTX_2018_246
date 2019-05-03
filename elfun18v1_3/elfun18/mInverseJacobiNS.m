function result = mInverseJacobiNS( X, M )
%MINVERSEJACOBINS Inverse of the Jacobi function NS.
%   MINVERSEJACOBINS(X,M) is the inverse of Jacobi function NS for the
%   elements of argument X and parameter M. X and M must all be real and  
%   the same size or any of them can be scalar. 
%
%   See also INVERSEJACOBINS

%   MINVERSEJACOBINS is a wrapper function which mimics the elemental 
%   behaviour of function MIJNS.

%   Functions called:
%       mijns, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mijns, X, M);
    
end

