function result = mJacobiCS( X, M )
%MJACOBICS Jacobi's elliptic function cs.
%   MJACOBICD(X,M) computes Jacobi's function CS for elements of 
%   argument X and parameter M. X and M must all be real and the same size 
%   or any of them can be scalar.
%
%   See also JACOBICS

%   MJACOBICS is a wrapper function which mimics the elemental 
%   behaviour of function MJCS.

%   Functions called:
%       mjcs, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mjcs, X, M);
    
end

