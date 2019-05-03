function result = mJacobiND( X, M )
%MJACOBINC Jacobi's elliptic function nd.
%   MJACOBIND(X,M) computes Jacobi's function ND for elements of 
%   argument X and parameter M. X and M must all be real and the same size 
%   or any of them can be scalar.
%
%   See also JACOBIND

%   MJACOBIND is a wrapper function which mimics the elemental 
%   behaviour of function MJND.

%   Functions called:
%       mjnd, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mjnd, X, M);
    
end

