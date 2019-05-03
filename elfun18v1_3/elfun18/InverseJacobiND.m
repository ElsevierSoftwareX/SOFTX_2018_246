function result = InverseJacobiND( X, K )
%INVERSEJACOBIND Inverse of the Jacobi function ND.
%   INVERSEJACOBIND(X,K) is the inverse of Jacobi function ND for 
%   elements of argument X and modulus K. X and K must all be real and the 
%   same size or any of them can be scalar. 
%
%   See also MINVERSEJACOBIND

%   INVERSEJACOBIND is a wrapper function which mimics the elemental 
%   behaviour of function IJND.

%   Functions called:
%       ijnd, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@ijnd, X, K);
    
end

