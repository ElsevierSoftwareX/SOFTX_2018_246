function result = InverseJacobiSC( X, K )
%INVERSEJACOBISC Inverse of the Jacobi function SC.
%   INVERSEJACOBISC(X,K) is the inverse of Jacobi function SC for 
%   elements of argument X and modulus K. X and K must all be real and the 
%   same size or any of them can be scalar. 
%
%   See also MINVERSEJACOBISC

%   INVERSEJACOBISC is a wrapper function which mimics the elemental 
%   behaviour of function IJSC.

%   Functions called:
%       ijsc, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@ijsc, X, K);
    
end

