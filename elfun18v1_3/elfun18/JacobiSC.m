function result = JacobiSC( X, K )
%JACOBISC Jacobi's function sc.
%   JACOBISC(X,K) is the Jacobi's function SC of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%
%   See also MJACOBISC

%   JACOBISC is a wrapper function which mimics the elemental behaviour
%   of function jsc.

%   Functions called:
%       jsc, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@jsc, X, K);
    
end

