function result = JacobiOmega( X, N, K )
%JACOBIOMEGA  Omega Function (periodic part of the elliptic Lambda func.).
%   JACOBIOMEGA(X,N,K) is the elliptic Omega function of the elements of
%   X, N and modulus K. X, N and K must all be real and the same size or  
%   any of them can be scalar.
%
%   See also MJACOBIOMEGA

%   JACOBIOMEGA is a wrapper function which mimics the elemental 
%   behaviour of function elomega.

%   Functions called:
%       jomega, ufun3

    if nargin < 3
        error('Not enough input arguments.');
    end

    result = ufun3(@jomega, X, N, K);
    
end

