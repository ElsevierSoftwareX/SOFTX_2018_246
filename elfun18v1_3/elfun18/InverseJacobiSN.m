function result = InverseJacobiSN( X, K )
%INVERSEJACOBISN Inverse of the Jacobi function SN.
%   INVERSEJACOBISN(X,K) is the inverse of Jacobi function SN for 
%   elements of argument X and modulus K. X and K must all be real and the 
%   same size or any of them can be scalar. 
%
%   See also MINVERSEJACOBISN

%   INVERSEJACOBISN is a wrapper function which mimics the elemental 
%   behaviour of function IJSN.

%   Functions called:
%       ijsn, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@ijsn, X, K);
    
end

