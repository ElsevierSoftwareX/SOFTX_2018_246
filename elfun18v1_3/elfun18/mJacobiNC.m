function result = mJacobiNC( X, M )
%MJACOBINC Jacobi's function nc.
%   MJACOBINC(X,M) computes Jacobi's function NC for elements of 
%   argument X and parameter M. X and M must all be real and the same size 
%   or any of them can be scalar.
%
%   See also JACOBINC

%   MJACOBINC is a wrapper function which mimics the elemental 
%   behaviour of function MJNC.

%   Functions called:
%       mjnc, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mjnc, X, M);
    
end

