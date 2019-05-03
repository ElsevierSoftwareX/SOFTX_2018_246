function result = mEllipticF( X, M )
%MELLIPTICF  Jacobi's form of the elliptic integral of the 1st kind. 
%   MELLIPTICF(X,M) is the Jacobi's form of  elliptic integral of the
%   1st kind F of elements of X and parameter M. X and M must be real and 
%   of the same size or any of them can be real scalar. 
%
%   See also
%       mEllipticF

%   MELLIPTICF is a wrapper function which mimics the elemental behaviour
%   of function melF.

%   Functions called:
%       melF, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@melF, X, M);
    
end

