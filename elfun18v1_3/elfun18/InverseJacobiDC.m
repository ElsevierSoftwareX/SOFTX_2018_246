function result = InverseJacobiDC( X, K )
%INVERSEJACOBIDC Inverse of the Jacobi function DC.
%   INVERSEJACOBIDC(X,K) is the inverse of Jacobi function DC for 
%   elements of argument X and modulus K. X and K must all be real and the 
%   same size or any of them can be scalar. 
%
%   See also MINVERSEJACOBIDC

%   INVERSEJACOBIDC is a wrapper function which mimics the elemental 
%   behaviour of function IJDC.

%   Functions called:
%       ijdc, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@ijdc, X, K);
    
end

