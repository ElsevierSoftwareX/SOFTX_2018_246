function result = pEllipticD( Phi, K )
%PELLIPTICD  Legendre elliptic integral D(phi,k). 
%   PELLIPTICD(Phi,K) is elliptic integral D of the elements of Phi
%   (argument) and K (modulus). Phi and K must be real and the same size or
%   any of them can be scalar.
%
%   PELLIPTICD(K) is the complete elliptic integral D of the
%   elements of K (modulus). The elements of K must all be real.

%   See also
%       pEllipticB, pEllipticE, pEllipticF, pEllipticPi

%   PELLIPTICD is a wrapper function which mimics the elemental behaviour
%   of function pelD.

%   Functions called:
%       pelD, elD, ufun1, ufun2

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    if nargin == 1
        result = ufun1(@elD, Phi);
    else
        result = ufun2(@pelD, Phi, K);
    end
    
end

