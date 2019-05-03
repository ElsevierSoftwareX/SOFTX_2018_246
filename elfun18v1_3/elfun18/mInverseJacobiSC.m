function result = mInverseJacobiSC( X, M )
%MINVERSEJACOBISC Inverse of the Jacobi function SC.
%   MINVERSEJACOBISC(X,M) is the inverse of Jacobi function SC for the
%   elements of argument X and parameter M. X and M must all be real and  
%   the same size or any of them can be scalar. 
%
%   See also INVERSEJACOBISC

%   MINVERSEJACOBISC is a wrapper function which mimics the elemental 
%   behaviour of function MIJSC.

%   Functions called:
%       mijsc, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mijsc, X, M);
    
end

