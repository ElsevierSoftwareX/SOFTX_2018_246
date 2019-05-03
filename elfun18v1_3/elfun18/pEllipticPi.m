function result = pEllipticPi( Phi, N, K )
%PELLIPTICPI  Legendre elliptic integral of the third kind. 
%   PELLIPTICB(Phi,N, K) is elliptic integral of the third kind of the
%   elements of Phi (argument), N (characteristic) and K (modulus). Phi, N 
%   and K must be real and the same size or any of them can be scalar.
%
%   PELLIPTICPI(N,K) is the complete elliptic integral of the third kind of 
%   the elements of N and K.  N and K must be real and the same size or
%   any of them can be scalar.

%   See also
%       pEllipticB, pEllipticD, pEllipticE, pEllipticF

%   PELLIPTICPI is a wrapper function which mimics the elemental behaviour
%   of function pelPi.

%   Functions called:
%       pelPi, elPi, ufun2, ufun3

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    if nargin == 2
        result = ufun2(@elPi, Phi, N);
    else
        result = ufun3(@pelPi, Phi, N, K);
    end
    
end

