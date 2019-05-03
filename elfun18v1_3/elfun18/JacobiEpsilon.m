function result = JacobiEpsilon( X, K )
%JACOBIEPSILON Jacobi's Epsilon function.
%   JACOBIEPSILON(X,K) is the Jacobi's Epsilon function of the elements of X and
%   modulus K. X and K must all be real and the same size or any of them
%   can be scalar.
%
%   See also MJACOBIEPSILON

%   JACOBIEPSILON is a wrapper function which mimics the elemental behaviour
%   of function jepsilon.

%   Functions called:
%       jepsilon, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    result = ufun2(@jepsilon, X, K);
    
end

