function result = InverseJacobiNC( X, K )
%INVERSEJACOBINC Inverse of the Jacobi function NC.
%   INVERSEJACOBINC(X,K) is the inverse of Jacobi function NC for 
%   elements of argument X and modulus K. X and K must all be real and the 
%   same size or any of them can be scalar. 
%
%   See also MINVERSEJACOBINC

%   INVERSEJACOBINC is a wrapper function which mimics the elemental 
%   behaviour of function IJNC.

%   Functions called:
%       ijnc, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@ijnc, X, K);
    
end

