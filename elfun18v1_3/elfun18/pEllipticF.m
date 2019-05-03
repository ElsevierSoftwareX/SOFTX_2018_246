function result = pEllipticF( Phi, K )
%PELLIPTICF  Legendre elliptic integral of the first kind. 
%   PELLIPTICF(Phi,K) is elliptic integral of 1st kind of the
%   elements of Phi (argument) and K (modulus). Phi and K must be real and 
%   the same size or any of them can be scalar.
%
%   PELLIPTICF(K) is the complete elliptic integral of the 1nd kind of the
%   elements of K (modulus). The elements of K must all be real.

%   See also
%       pEllipticB, pEllipticD, pEllipticE, pEllipticPi

%   PELLIPTICF is a wrapper function which mimics the elemental behaviour
%   of function pelF.

%   Functions called:
%       pelF, elK, ufun1, ufun2

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    if nargin == 1
        result = ufun1(@elK, Phi);
    else
        result = ufun2(@pelF, Phi, K);
    end
    
end

