function result = EllipticD( X, K )
%ELLIPTICD  Jacobi form of the elliptic integral D. 
%   ELLIPTICD(X,K) is Jacobi's form of the elliptic integral D 
%   of elements of X and K (modulus).The elements of X and K must be 
%   real and of the same size.
%
%   ELLIPTICD(K) is the complete elliptic integral D for elements modulus
%   K. Elements K must all be real.

%   See also
%       mEllipticD

%   ELLIPTICD is interface function which mimics the elemental behaviour
%   of function elD.

%   Functions called:
%       elD, ufun1, ufun2

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    if nargin == 1
        result = ufun1(@elD, X);
    else
        result = ufun2(@elD, X, K);
    end
    
end

