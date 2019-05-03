function result = mJacobiSC( X, M )
%MJACOBISC Jacobi's function function sc.
%   Y = MJACOBISC(X,M) computes Jacobi's function SC for elements of 
%   argument X and parameter M. X and M must all be real and the same size 
%   or any of them can be scalar.
%
%   See also JACOBISC

%   MJACOBISC is a wrapper function which mimics the elemental 
%   behaviour of function MJSC.

%   Functions called:
%       mjsc, ufun2


    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@mjsc, X, M);
    
end

