function result = mInverseJacobiCD( X, M )
%MINVERSEJACOBICD Inverse of the Jacobi function CD.
%   MINVERSEJACOBICD(X,M) is the inverse of Jacobi function CD for the
%   elements of argument X and parameter M. X and M must all be real and  
%   the same size or any of them can be scalar. 
%
%   See also INVERSEJACOBICD

%   MINVERSEJACOBICD is a wrapper function which mimics the elemental 
%   behaviour of function MIJCD.

%   Functions called:
%       mijcd, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mijcd, X, M);
    
end

