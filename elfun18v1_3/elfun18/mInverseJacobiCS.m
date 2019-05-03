function result = mInverseJacobiCS( X, M )
%MINVERSEJACOBICS Inverse of the Jacobi function CS.
%   MINVERSEJACOBICS(X,K) is the inverse of Jacobi function CS for the
%   elements of argument X and parameter M. X and M must all be real and  
%   the same size or any of them can be scalar. 
%
%   See also INVERSEJACOBICS

%   MINVERSEJACOBICS is a wrapper function which mimics the elemental 
%   behaviour of function MIJCS.

%   Functions called:
%       mijcs, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mijcs, X, M);
    
end

