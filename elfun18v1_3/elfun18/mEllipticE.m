function result = mEllipticE( X, M )
%MELLIPTICE  Jacobi form of the elliptic integral of the second kind. 
%   MELLIPTICE(X,M) is  elliptic integral of the elements of X and M
%   (parameter). X and M must be real and of the same size or any of them
%   can be scalar.  
%
%   MELLIPTICE(M) is  complete elliptic integral of the elements of M.
%   M must be real.

%   See also
%       EllipticE

%   MELLIPTICE is a wrapper function which mimics the elemental behaviour
%   of function melE and mcelE.

%   Functions called:
%       mcelE, melE, ufun1, ufun2

    if nargin < 1
        error('Not enough input arguments.');
    end

    if nargin == 1
        result = ufun1(@mcelE, X);
    else
        result = ufun2(@melE, X, M);
    end
    
end

