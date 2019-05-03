function result = InverseJacobiNS( X, K )
%INVERSEJACOBINS Inverse of the Jacobi function NS.
%   INVERSEJACOBINS(X,K) is the inverse of Jacobi function NS for 
%   elements of argument X and modulus K. X and K must all be real and the 
%   same size or any of them can be scalar. 
%
%   See also MINVERSEJACOBINS

%   INVERSEJACOBINS is a wrapper function which mimics the elemental 
%   behaviour of function IJNS.

%   Functions called:
%       ijns, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@ijns, X, K);
    
end

