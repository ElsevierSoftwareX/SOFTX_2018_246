function result = EllipticB( X, K )
%ELLIPTICB  Jacobi's form of elliptic integral B. 
%   ELLIPTICB(X,K) is the  elliptic integral B of the elements of
%   X and K (modulus). X and K must be real and of the same size or any
%   of them can be real scalar. 
%
%   ELLIPTICB(K) is the complete elliptic integral B of the elements of K.
%   The elements of K must all be real.

%   See also
%       mEllipticB

%   ELLIPTICB is a wrapper function which mimics the elemental behaviour
%   of functions celB and elB.

%   Functions called:
%       elB, ufun1, ufun2

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    if nargin == 1
        result = ufun1(@elB, X);
    else
        result = ufun2(@elB, X, K);
    end
    
end

