function result = mJacobiCD( X, M )
%MJACOBICD Jacobi's elliptic function cd.
%   MJACOBICD(X,M) computes Jacobi's function CD for elements of 
%   argument X and parameter M. X and M must all be real and the same size 
%   or any of them can be scalar.
%
%   See also JACOBICD

%   MJACOBICD is a wrapper function which mimics the elemental 
%   behaviour of function MJCD.

%   Functions called:
%       mjcd, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mjcd, X, M);
    
end

