function result = JacobiDN( X, K )
%JACOBIDC Jacobi's function dn.
%   JACOBIDN(X,K) is the Jacobi's function DN of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%
%   See also MJACOBIDN

%   JACOBIDN is a wrapper function which mimics the elemental behaviour
%   of function jdn.

%   Functions called:
%       jcdn, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@jdn, X, K);
    
end

