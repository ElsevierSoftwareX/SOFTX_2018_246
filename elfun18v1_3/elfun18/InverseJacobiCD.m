function result = InverseJacobiCD( X, K )
%INVERSEJACOBICD Inverse of the Jacobi function CD.
%   INVERSEJACOBICD(X,K) is the inverse of Jacobi function CD for 
%   elements of argument X and modulus K. X and K must all be real and the 
%   same size or any of them can be scalar. 
%
%   See also MINVERSEJACOBICD

%   INVERSEJACOBICD is a wrapper function which mimics the elemental 
%   behaviour of function IJCD.

%   Functions called:
%       ijcd, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@ijcd, X, K);
    
end

