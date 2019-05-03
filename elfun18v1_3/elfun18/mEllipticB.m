function result = mEllipticB( X, M )
%MELLIPTICB  Jacobi's form of elliptic integral B. 
%   MELLIPTICB(X,M) is the  elliptic integral B of the elements of
%   X and M (parameter). X and M must be real and of the same size or any
%   of them can be real scalar. 
%
%   MELLIPTICB(M) is the complete elliptic integral B of the elements of M.
%   The elements of M must all be real.

%   See also
%       EllipticB

%   MELLIPTICB is a wrapper function which mimics the elemental behaviour
%   of function elB.

%   Functions called:
%       mcelB, melB, ufun1, ufun2

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    if nargin == 1
        result = ufun1(@mcelB, X);
    else
        result = ufun2(@melB, X, M);
    end
    
end

