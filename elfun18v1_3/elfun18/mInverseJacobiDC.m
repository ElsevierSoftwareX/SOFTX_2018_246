function result = mInverseJacobiDC( X, M )
%MINVERSEJACOBIDC Inverse of the Jacobi function DC.
%   MINVERSEJACOBIDC(X,K) is the inverse of Jacobi function DC for the
%   elements of argument X and parameter M. X and M must all be real and  
%   the same size or any of them can be scalar. 
%
%   See also INVERSEJACOBIDC

%   MINVERSEJACOBIDC is a wrapper function which mimics the elemental 
%   behaviour of function MIJDC.

%   Functions called:
%       mijdc, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mijdc, X, M);
    
end

