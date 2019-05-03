function result = mJacobiCN( X, M )
%MJACOBISN Jacobi's elliptic function cn.
%   MJACOBICN(X,M) computes Jacobi's function CN for elements of 
%   argument X and parameter M. X and M must all be real and the same size 
%   or any of them can be scalar.
%
%   See also JACOBICN

%   MJACOBICN is a wrapper function which mimics the elemental 
%   behaviour of function MJCN.

%   Functions called:
%       mjcn, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mjcn, X, M);
    
end

