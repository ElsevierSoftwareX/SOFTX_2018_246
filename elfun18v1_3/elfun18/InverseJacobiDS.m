function result = InverseJacobiDS( X, K )
%INVERSEJACOBIDS Inverse of the Jacobi function DS.
%   INVERSEJACOBIDS(X,K) is the inverse of Jacobi function DS for 
%   elements of argument X and modulus K. X and K must all be real and the 
%   same size or any of them can be scalar. 
%
%   See also MINVERSEJACOBIDS

%   INVERSEJACOBIDS is a wrapper function which mimics the elemental 
%   behaviour of function IJDS.

%   Functions called:
%       ijds, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@ijds, X, K);
    
end

