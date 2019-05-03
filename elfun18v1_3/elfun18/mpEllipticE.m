function result = mpEllipticE( Phi, M )
%MPELLIPTICE  Legendre elliptic integral of the second kind. 
%   MPELLIPTICE(Phi,K) is elliptic integral of 2nd kind of the
%   elements of Phi (argument) and K (modulus). Phi and K must be real and
%   the same size or any of them can be scalar.
%
%   MPELLIPTICE(K) is the complete elliptic integral of the 2nd kind of the
%   elements of K (modulus). The elements of K must all be real.

%   See also
%       mpEllipticB, mpEllipticD, mpEllipticF, mpEllipticPi

%   MPELLIPTICE is a wrapper function which mimics the elemental behaviour
%   of function pelE.

%   Functions called:
%       pmelE, mcelE, ufun1, ufun2

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    if nargin == 1
        result = ufun1(@mcelE, Phi);
    else
        result = ufun2(@mpelE, Phi, M);
    end
    
end

