function result = JacobiSN( X, K )
%JACOBISN Jacobi's function sn.
%   JACOBISN(X,K) is the Jacobi's function DS of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%
%   See also MJACOBISN

%   JACOBISN is a wrapper function which mimics the elemental behaviour
%   of function jsn.

%   Functions called:
%       jsn, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@jsn, X, K);
    
end

