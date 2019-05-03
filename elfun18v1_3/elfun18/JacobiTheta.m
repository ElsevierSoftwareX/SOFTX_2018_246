function result = JacobiTheta( X, K )
%JACOBIETA Jacobi's Theta function.
%   JACOBITHETA(X,K) is the Jacobi's Eta function of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%

%   JACOBTHETA is a wrapper function which mimics the elemental behaviour
%   of function jtheta.

%   Functions called:
%       jtheta, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@jtheta, X, K);
    
end

