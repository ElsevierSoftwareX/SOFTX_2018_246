function result = JacobiDS( X, K )
%JACOBIDC Jacobi's function ds.
%   JACOBIDS(X,K) is the Jacobi's function DS of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%
%   See also MJACOBIDS

%   JACOBIDS is a wrapper function which mimics the elemental behaviour
%   of function jds.

%   Functions called:
%       jds, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@jds, X, K);
    
end

