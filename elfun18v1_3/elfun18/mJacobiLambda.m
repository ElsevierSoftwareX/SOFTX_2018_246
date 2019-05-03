function result = mJacobiLambda( X, NU, M )
%MJACOBILAMBDA  Elliptic Lambda function (Jacobi 2nd form of elliptic
%   integral of 3rd kind).
%   MJACOBILAMBDA(X,NU,M)  is the Jacobi's 2nd form of  elliptic integral 
%   of the 3rd kind of elements of X, NU and parameter M. X, NU, M must be 
%   real and of the same size or any of them can be real scalar. 
%
%   See also JACOBILAMBDA

%   MJACOBILAMBDA is a wrapper function which mimics the elemental 
%   behaviour of function mjlambda.

%   Functions called:
%       mjlambda, ufun2

    if nargin < 3
        error('Not enough input arguments.');
    end

    result = ufun3(@mjlambda, X, NU, M);
    
end

