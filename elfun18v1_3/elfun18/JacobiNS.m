function result = JacobiNS( X, K )
%JACOBINC Jacobi's function ns.
%   JACOBINS(X,K) is the Jacobi's function NS of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%
%   See also MJACOBINS

%   JACOBINS is a wrapper function which mimics the elemental behaviour
%   of function jns.

%   Functions called:
%       jns, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@jns, X, K);
    
end

