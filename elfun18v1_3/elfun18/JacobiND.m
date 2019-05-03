function result = JacobiND( X, K )
%JACOBINC Jacobi's function nd.
%   JACOBIND(X,K) is the Jacobi's function ND of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%
%   See also MJACOBIND

%   JACOBIND is a wrapper function which mimics the elemental behaviour
%   of function jnd.

%   Functions called:
%       jnd, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@jnd, X, K);
    
end

