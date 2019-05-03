function result = mEllipticD( X, M )
%MELLIPTICD  Jacobi form of the elliptic integral D. 
%   MELLIPTICD(X,M) is Jacobi's form of elliptic integral D 
%   of elements of X and M (parameter).The elements of X and M must be 
%   real and of the same size.
%
%   MELLIPTICD(M) is the the complete elliptic integral D for elements 
%   parameter M. Elements M must all be real.

%   See also
%       EllipticD


%   MELLIPTICD is a wrapper function which mimics the elemental behaviour
%   of function melD.

%   Functions called:
%       mcelD, melD, ufun1, ufun2

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    if nargin == 1
        result = ufun1(@mcelD, X);
    else
        result = ufun2(@melD, X, M);
    end
    
end

