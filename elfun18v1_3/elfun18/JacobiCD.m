function result = JacobiCD( X, K )
%JACOBICD Jacobi's function cd.
%   JACOBICD(X,K) is the Jacobi's function CD of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%
%   See also MJACOBICD

%   JACOBICD is a wrapper function which mimics the elemental behaviour
%   of function JCD.

%   Functions called:
%       jcd, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@jcd, X, K);
    
end

