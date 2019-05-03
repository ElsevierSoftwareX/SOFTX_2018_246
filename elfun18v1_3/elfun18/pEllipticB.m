function result = pEllipticB( Phi, K )
%PELLIPTICB  Legendre elliptic integral B(phi,k). 
%   PELLIPTICB(Phi,K) is elliptic integral B of the elements of Phi 
%   (argument) and K (modulus). Phi and K must be real and the same size
%   or any of them can be scalar.
%
%   PELLIPTICB(K) is the complete elliptic integral B of the
%   elements of K (modulus). The elements of K must all be real.

%   See also
%       pEllipticD, pEllipticE, pEllipticF, pEllipticPi

%   PELLIPTICB is a wrapper function which mimics the elemental behaviour
%   of function pelE.

%   Functions called:
%       pelB, elB, ufun1, ufun2

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    if nargin == 1
        result = ufun1(@elB, Phi);
    else
        result = ufun2(@pelB, Phi, K);
    end
    
end

