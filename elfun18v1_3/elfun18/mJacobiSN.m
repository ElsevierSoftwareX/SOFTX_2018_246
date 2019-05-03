function result = mJacobiSN( X, M )
%MJACOBISN Jacobi's elliptic function sn.
%   MJACOBISN(X,M) computes Jacobi's function sn for elements of 
%   argument X and parameter M. X and M must all be real and the same size 
%   or any of them can be scalar.
%
%   See also JACOBISN

%   MJACOBISN is a wrapper function which mimics the elemental 
%   behaviour of function MJSN.

%   Functions called:
%       mjsn, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mjsn, X, M);
    
end

