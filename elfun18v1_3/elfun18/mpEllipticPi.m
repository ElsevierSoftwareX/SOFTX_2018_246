function result = mpEllipticPi( Phi, N, M )
%MPELLIPTICPI  Legendre elliptic integral of the third kind. 
%   MPELLIPTICB(Phi,N,M) is elliptic integral of the third kind of the
%   elements of Phi (argument), N (characteristic) and M (parameter). Phi,N 
%   and M must be real and the same size or any of them can be scalar.
%
%   MPELLIPTICPI(N,M) is the complete elliptic integral of the third kind  
%   of the elements of N and M.  N and M must be real and the same size or
%   any of them can be scalar.

%   See also
%       pEllipticPi

%   MPELLIPTICPI is a wrapper function which mimics the elemental behaviour
%   of function mpelPi.

%   Functions called:
%       mpelPi, mcelPi, ufun2, ufun3

    if nargin < 2
        error('Not enough input arguments.');
    end
    
    if nargin == 2
        result = ufun2(@mcelPi, Phi, N);
    else
        result = ufun3(@mpelPi, Phi, N, M);
    end
    
end

