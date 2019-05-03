function result = mJacobiOmega( X, N, M )
%MJACOBIOMEGA  Omega Function (periodic part of elliptic Lambda function)
%   MJACOBIOMEGA(X,N,M) is the elliptic Omega function of the elements of  
%   X, N and parameter M. X, N and M must all be real and the same size or  
%   any ofthem can be scalar.
%
%   See also JACOBIOMEGA

%   MJACOBIOMEGA is a wrapper function which mimics the elemental 
%   behaviour of function mjomega.

%   Functions called:
%       mjomega, ufun3

    if nargin < 3
        error('Not enough input arguments.');
    end

    result = ufun3(@mjomega, X, N, M);
    
end

