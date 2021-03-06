function result = JacobiSD( X, K )
%JACOBISC Jacobi's function sd.
%   JACOBISD(X,K) is the Jacobi's function SD of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%
%   See also MJACOBISD

%   JACOBISD is a wrapper function which mimics the elemental behaviour
%   of function jsd.

%   Functions called:
%       jsd, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@jsd, X, K);
    
end

