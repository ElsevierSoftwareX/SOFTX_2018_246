function result = JacobiCN( X, K )
%JACOBICN Jacobi's function cn.
%   JACOBICN(X,K) is the Jacobi's function CN of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%
%   See also MJACOBICN

%   JACOBICN is a wrapper function which mimics the elemental behaviour
%   of function jcn.

%   Functions called:
%       jcnd, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@jcn, X, K);
    
end

