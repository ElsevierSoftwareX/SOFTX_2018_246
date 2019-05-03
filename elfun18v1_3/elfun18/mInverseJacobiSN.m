function result = mInverseJacobiSN( X, M )
%MINVERSEJACOBISN Inverse of the Jacobi function SN.
%   MINVERSEJACOBISN(X,M) is the inverse of Jacobi function SN for the
%   elements of argument X and parameter M. X and M must all be real and  
%   the same size or any of them can be scalar. 
%
%   See also INVERSEJACOBISN

%   MINVERSEJACOBISN is a wrapper function which mimics the elemental 
%   behaviour of function MIJSN.

%   Functions called:
%       mijsn, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mijsn, X, M);
    
end

