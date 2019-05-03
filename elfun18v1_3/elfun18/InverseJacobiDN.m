function result = InverseJacobiDN( X, K )
%INVERSEJACOBIDN Inverse of the Jacobi function DN.
%   INVERSEJACOBIDN(X,K) is the inverse of Jacobi function DN for 
%   elements of argument X and modulus K. X and K must all be real and the 
%   same size or any of them can be scalar. 
%
%   See also MINVERSEJACOBIDN

%   INVERSEJACOBIDN is a wrapper function which mimics the elemental 
%   behaviour of function IJDN.

%   Functions called:
%       ijdn, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@ijdn, X, K);
    
end

