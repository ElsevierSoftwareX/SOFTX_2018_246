function result = JacobiCS( X, K )
%JACOBICS Jacobi's function cs.
%   JACOBICS(X,K) is the Jacobi's function CS of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%
%   See also MJACOBICS

%   JACOBICS is a wrapper function which mimics the elemental behaviour
%   of function jcs.

%   Functions called:
%       jcs, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@jcs, X, K);
    
end

