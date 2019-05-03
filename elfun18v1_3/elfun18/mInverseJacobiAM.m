function result = mInverseJacobiAM( X, M )
%MINVERSEJACOBIAM Inverse of the Jacobi amplitude function AM.
%   MINVERSEJACOBIAM(X,M) is the inverse of Jacobi function AM for the
%   elements of argument X and parameter M. X and M must all be real and  
%   the same size or any of them can be scalar. 
%
%   See also INVERSEJACOBIAM

%   MINVERSEJACOBIAM is a wrapper function which mimics the elemental 
%   behaviour of function MIJAM.

%   Functions called:
%       mijam, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mijam, X, M);
    
end

