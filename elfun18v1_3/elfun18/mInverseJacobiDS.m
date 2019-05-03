function result = mInverseJacobiDS( X, M )
%MINVERSEJACOBIDS Inverse of the Jacobi function DS.
%   MINVERSEJACOBIDS(X,K) is the inverse of Jacobi function DS for the
%   elements of argument X and parameter M. X and M must all be real and  
%   the same size or any of them can be scalar. 
%
%   See also INVERSEJACOBIDS

%   MINVERSEJACOBIDS is a wrapper function which mimics the elemental 
%   behaviour of function MIJDS.

%   Functions called:
%       mijds, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mijds, X, M);
    
end

