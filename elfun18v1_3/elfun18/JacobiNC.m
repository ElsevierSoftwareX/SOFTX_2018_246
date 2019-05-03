function result = JacobiNC( X, K )
%JACOBINC Jacobi's function nc.
%   JACOBINC(X,K) is the Jacobi's function NC of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%
%   See also MJACOBINC

%   JACOBINC is a wrapper function which mimics the elemental behaviour
%   of function jnc.

%   Functions called:
%       jnc, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@jnc, X, K);
    
end

