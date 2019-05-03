function result = JacobiZeta( X, K )
%JACOBIZETA Jacobi's Zeta function (periodic part of Jacobi Epsilon fun.)
%   JACOBIDS(X,K) is the Jacobi's Zeta function of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%
%   See also MJACOBIZETA

%   JACOBIZETA is a wrapper function which mimics the elemental behaviour
%   of function jzeta.

%   Functions called:
%       jzeta, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@jzeta, X, K);
    
end

