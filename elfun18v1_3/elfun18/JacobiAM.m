function result = JacobiAM( X, K )
%JACOBIAM Jacobi's Amplitude Function.
%   JACOBIAM(X,K) is the Jacobi's amplitude function AM of the elements of 
%   X and modulus K. X and K must all be real and the same size or any of
%   them can be scalar.
%
%   See also MJACOBIAM

%   JACOBIAM is a wrapper function which mimics the elemental behaviour
%   of function JAM.

%   Functions called:
%       jam, ufun2

    if nargin < 2
        error('Not enough input arguments.');
    end

    result = ufun2(@jam, X, K);
    
end

