function result = InverseJacobiCN( X, K )
%INVERSEJACOBICN Inverse of the Jacobi function CN.
%   INVERSEJACOBICN(X,K) is the inverse of Jacobi function CN for 
%   elements of argument X and modulus K. X and K must all be real and the 
%   same size or any of them can be scalar. 
%
%   See also MINVERSEJACOBICN

%   INVERSEJACOBICN is a wrapper function which mimics the elemental 
%   behaviour of function IJCN.

%   Functions called:
%       ijcn, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@ijcn, X, K);
    
end

