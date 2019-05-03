function result = JacobiEta( X, K )
%JACOBIETA Jacobi's Eta function.
%   JACOBIETA(X,K) is the Jacobi's Eta function of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%

%   JACOBETA is a wrapper function which mimics the elemental behaviour
%   of function jeta.

%   Functions called:
%       jeta, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@jeta, X, K);
    
end

