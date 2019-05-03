function result = mJacobiZeta( X, M )
%MJACOBIZETA Jacobi's Zeta function.
%   MJACOBIZETA(X,M) computes Jacobi's Zeta function for elements of 
%   argument X and parameter M. X and M must all be real and the same size
%   or any of them can be scalar.
%
%   See also JACOBIZETA

%   MJACOBIZETA is a wrapper function which emulates the elemental 
%   behaviour of function MJZETA.

%   Functions called:
%       mjzeta, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@mjzeta, X, M);
    
end

