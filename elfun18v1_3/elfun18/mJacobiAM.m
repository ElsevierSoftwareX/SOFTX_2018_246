function result = mJacobiAM( X, M )
%MJACOBIAM Jacobi's Amplitude Function.
%   MJACOBIAM(X,M) computes Jacobi's amplitude function am for 
%   elements of X and parameter M. X and M must all be real and the same 
%   size or any of them can be scalar.
%
%   See also JACOBIAM

%   MJACOBIAM is a wrapper function which emulates the elemental 
%   behaviour of function MJAM.

%   Functions called:
%       mjam, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mjam, X, M);
    
end

