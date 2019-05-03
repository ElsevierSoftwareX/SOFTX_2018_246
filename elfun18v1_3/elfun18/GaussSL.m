function result = GaussSL( X )
%GAUSSSL Gauss lemniscate sin.
%   GAUSSSL(X) is the Gauss's lemniscate sin of the elements of X.
%   The elements of X must be real.

%   GAUSSSL is interface function which mimics the elemental behaviour
%   of function gsl.

%   Functions called:
%       gsl, ufun1

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    result = ufun1(@gsl, X);
    
end

