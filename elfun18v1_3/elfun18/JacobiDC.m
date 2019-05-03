function result = JacobiDC( X, K )
%JACOBIDC Jacobi's function dc.
%   JACOBIDC(X,K) is the Jacobi's function DC of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%
%   See also MJACOBISDC

%   JACOBIDC is a wrapper function which mimics the elemental behaviour
%   of function jdc.

%   Functions called:
%       jcdc, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@jdc, X, K);
    
end

