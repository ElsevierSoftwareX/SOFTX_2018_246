function result = mInverseJacobiNC( X, M )
%MINVERSEJACOBINC Inverse of the Jacobi function NC.
%   MINVERSEJACOBINC(X,M) is the inverse of Jacobi function NC for the
%   elements of argument X and parameter M. X and M must all be real and  
%   the same size or any of them can be scalar. 
%
%   See also INVERSEJACOBINC

%   MINVERSEJACOBINC is a wrapper function which mimics the elemental 
%   behaviour of function MIJNC.

%   Functions called:
%       mijnc, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mijnc, X, M);
    
end

