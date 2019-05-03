function result = mJacobiSD( X, M )
%MJACOBISC Jacobi's function sd.
%   Y = MJACOBISD(X,M) computes Jacobi's function SD for elements of 
%   argument X and parameter M. X and M must all be real and the same size 
%   or any of them can be scalar.
%
%   See also JACOBISD

%   MJACOBISD is a wrapper function which mimics the elemental 
%   behaviour of function MJSD.

%   Functions called:
%       mjsd, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mjsd, X, M);
    
end

