function result = mInverseJacobiCN( X, M )
%MINVERSEJACOBICN Inverse of the Jacobi function CN.
%   MINVERSEJACOBICN(X,M) is the inverse of Jacobi function CN for the
%   elements of argument X and parameter M. X and M must all be real and  
%   the same size or any of them can be scalar. 
%
%   See also INVERSEJACOBICN

%   MINVERSEJACOBICN is a wrapper function which mimics the elemental 
%   behaviour of function MIJCN.

%   Functions called:
%       mijcn, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mijcn, X, M);
    
end

