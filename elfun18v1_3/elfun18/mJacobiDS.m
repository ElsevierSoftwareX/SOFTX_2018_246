function result = mJacobiDS( X, M )
%MJACOBIDC Jacobi's elliptic function ds.
%   MJACOBIDS(X,M) computes Jacobi's function DS for elements of 
%   argument X and parameter M. X and M must all be real and the same size 
%   or any of them can be scalar.
%
%   See also JACOBIDS

%   MJACOBIDS is a wrapper function which mimics the elemental 
%   behaviour of function MJDS.

%   Functions called:
%       mjds, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mjds, X, M);
    
end

