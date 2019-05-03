function result = JacobiLambda( X, N, K )
%JACOBILAMBDA  Jacobi Lambda function (Jacobi 2nd form of elliptic
%   integral of 3rd kind).
%   JACOBILAMBDA(X,N,K) returns the Jacobi's 2nd form of elliptic integral 
%   of the 3rd kind of elements of X, N and modulus K. X, N and K must be 
%   real and of the same size or any of them can be real scalar. 
%
%   See also MJACOBILAMBDA

%   JACOBILAMBDA is a wrapper function which mimics the elemental 
%   behaviour of function ellambda.

%   Functions called:
%       jlambda, ufun2

    if nargin < 3
        error('Not enough input arguments.');
    end

    result = ufun3(@jlambda, X, N, K);
    
end

