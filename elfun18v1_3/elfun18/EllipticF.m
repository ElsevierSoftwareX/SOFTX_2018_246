function result = EllipticF( X, K )
%ELLIPTICF  Jacobi's form of the elliptic integral of the 1st kind. 
%   ELLIPTICF(X,K) is the Jacobi's form of  elliptic integral of the
%   1st kind F of elements of X and modulus K. X and K must be real and 
%   of the same size or any of them can be real scalar. 
%
%   See also
%       mEllipticF

%   ELLIPTICF is a wrapper function which mimics the elemental behaviour
%   of function elF.

%   Functions called:
%       elF, ufun1,  ufun2


    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@elF, X, K);
     
end

