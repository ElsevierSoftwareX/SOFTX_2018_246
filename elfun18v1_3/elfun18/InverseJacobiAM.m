function result = InverseJacobiAM( X, K )
%INVERSEJACOBIAM Inverse of the Jacobi amplitude function AM.
%   INVERSEJACOBIAM(X,K) is the inverse of Jacobi function AM for 
%   elements of argument X and modulus K. X and K must all be real and the 
%   same size or any of them can be scalar. 
%
%   See also MINVERSEJACOBIAM

%   INVERSEJACOBIAM is a wrapper function which mimics the elemental 
%   behaviour of function IJAM.

%   Functions called:
%       ijam, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@ijam, X, K);
    
end

