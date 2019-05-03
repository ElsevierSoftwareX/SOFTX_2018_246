function result = mInverseJacobiND( X, M )
%MINVERSEJACOBIND Inverse of the Jacobi function ND.
%   MINVERSEJACOBIND(X,M) is the inverse of Jacobi function ND for the
%   elements of argument X and parameter M. X and M must all be real and  
%   the same size or any of them can be scalar. 
%
%   See also INVERSEJACOBIND

%   MINVERSEJACOBIND is a wrapper function which mimics the elemental 
%   behaviour of function MIJND.

%   Functions called:
%       mijnd, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mijnd, X, M);
    
end

