function result = InverseJacobiCS( X, K )
%INVERSEJACOBICS Inverse of the Jacobi function CS.
%   INVERSEJACOBICS(X,K) is the inverse of Jacobi function CS for 
%   elements of argument X and modulus K. X and K must all be real and the 
%   same size or any of them can be scalar. 
%
%   See also MINVERSEJACOBICS

%   INVERSEJACOBICS is a wrapper function which mimics the elemental 
%   behaviour of function IJCS.

%   Functions called:
%       ijcs, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@ijcs, X, K);
    
end

