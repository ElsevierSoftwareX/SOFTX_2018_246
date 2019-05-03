function result = mpEllipticF( Phi, M )
%MPELLIPTICF  Legendre elliptic integral of the first kind. 
%   MPELLIPTICF(Phi,M) is elliptic integral of 1st kind of the
%   elements of Phi (argument) and M (parameter). Phi and M must be real and 
%   the same size or any of them can be scalar.
%
%   MPELLIPTICF(M) is the complete elliptic integral of the 1nd kind of the
%   elements of M. The elements of K must all be real.

%   See also
%       pEllipticF

%   MPELLIPTICF is a wrapper function which mimics the elemental behaviour
%   of function mpelF.

%   Functions called:
%       mpelF, melK, ufun1, ufun2

    if nargin < 1
        error('Not enough input arguments.');
    end
    
    if nargin == 1
        result = ufun1(@melK, Phi);
    else
        result = ufun2(@mpelF, Phi, M);
    end
    
end

