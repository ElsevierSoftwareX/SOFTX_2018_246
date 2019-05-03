function result = mJacobiNS( X, M )
%MJACOBINC Jacobi's function function ns.
%   MJACOBINS(X,M) computes Jacobi's function NS for elements of 
%   argument X and parameter M. X and M must all be real and the same size 
%   or any of them can be scalar.
%
%   See also JACOBINS

%   MJACOBINS is a wrapper function which mimics the elemental 
%   behaviour of function MJNS.

%   Functions called:
%       mjns, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mjns, X, M);
    
end

