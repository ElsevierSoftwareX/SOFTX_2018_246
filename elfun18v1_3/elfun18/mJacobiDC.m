function result = mJacobiDC( X, M )
%MJACOBIDC Jacobi's elliptic function dc.
%   MJACOBIDC(X,M) computes Jacobi's function DC for elements of 
%   argument X and parameter M. X and M must all be real and the same size 
%   or any of them can be scalar.
%
%   See also JACOBIDC

%   MJACOBIDC is a wrapper function which mimics the elemental 
%   behaviour of function MJDC.

%   Functions called:
%       mjdc, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mjdc, X, M);
    
end

