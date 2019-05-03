function result = mJacobiEpsilon( X, M )
%MJACOBIEPSILON Jacobi's Epsilon function (Jacobi's form of elliptic integral
%   of the 2nd kind).
%   MJACOBIEPSILON(X,M) computes Jacobi's Epsilon function for elements of 
%   argument X and parameter M. X and M must all be real and the same size 
%   or any of them can be scalar.
%
%   See also JACOBIEPSILON

%   MJACOBIEPSILON is a wrapper function which mimics the elemental 
%   behaviour of function MJEPSILON.

%   Functions called:
%       mjepsilon, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@mjepsilon, X, M);
    
end

