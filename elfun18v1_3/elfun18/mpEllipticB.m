function result = mpEllipticB( Phi, M )
%MPELLIPTICB  Legendre elliptic integral B. 
%   MPELLIPTICB(Phi,M) is elliptic integral  B of the elements of Phi 
%   (argument) and M (parameter). Phi and M must be real and the same size
%   or any of them can be scalar.
%
%   MPELLIPTICB(M) is the complete elliptic integral B of the
%   elements of M. The elements of M must all be real.

%   See also
%       pEllipticB

%   MPELLIPTICB is a wrapper function which mimics the elemental behaviour
%   of function mpelB.

%   Functions called:
%       mpelB, mcelB, ufun1, ufun2

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    if nargin == 1
        result = ufun1(@mcelB, Phi);
    else
        result = ufun2(@mpelB, Phi, M);
    end
    
end

